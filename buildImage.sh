docker container prune -f
docker image prune -f
docker build -t mvs:38j-tk5upd2-console .
# docker run -it --name myMVS -p 3270:3270/tcp -p 8080:8080/tcp mhardingdk/mvs
# docker exec -it myMVS c3270 localhost:3270
