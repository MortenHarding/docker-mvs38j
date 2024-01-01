FROM ubuntu:latest
RUN apt-get update && apt-get install -y locales curl unzip c3270 netbase && rm -rf /var/lib/apt/lists/* \
&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
&& mkdir /mvs
ENV LANG en_US.utf8
WORKDIR /mvs
EXPOSE 3270/tcp
EXPOSE 8080/tcp
RUN curl -O https://www.prince-webdesign.nl/images/downloads/mvs-tk5.zip \
&& chmod +x mvs-tk5.zip \
&& unzip mvs-tk5.zip \
&& chmod -R +x /mvs/mvs-tk5/*
ADD mvs_docker /mvs/mvs-tk5/mvs_docker
WORKDIR /mvs/mvs-tk5
ENTRYPOINT ["/bin/bash","./mvs_docker"]
