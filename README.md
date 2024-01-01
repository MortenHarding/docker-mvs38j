# docker-mvs38j
Build Docker container with MVS TK5 and c3270

Use the shell script to build a new image

```sh
./buildImage.sh
```

## _MVS 3.8j TK5 and c3270 emulator in one container_

How to start the container with MVS 3.8j

```sh
docker run -it --name myMVS -p 3270:3270/tcp -p 8080:8080/tcp mhardingdk/mvs
```

How to connect to MVS in the container using the included c3270 emulator

```sh
docker exec -it myMVS c3270 localhost:3270
```

## References

The following software packages are used in the container.
- [MVS Turn Key 5](https://www.prince-webdesign.nl/index.php/software/mvs-3-8j-turnkey-5) - by Rob Prince
- [c3270](https://x3270.miraheze.org/wiki/C3270) - 3270 emulator for Linux
