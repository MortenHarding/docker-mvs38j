docker container prune -f
docker image prune -f
docker build -t mvs:38j-tk5upd2-console .
# docker run -it --name mvs38j -p 3270:3270/tcp -p 8080:8080/tcp mhardingdk/mvs:38j-tk5upd2-console
# docker container start -it mvs38j
# docker exec -it mvs38j c3270 localhost:3270
