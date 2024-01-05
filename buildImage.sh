docker container prune -f
docker image prune -f
docker build -f Dockerfile-$1 -t mhardingdk/mvs:$1 .
