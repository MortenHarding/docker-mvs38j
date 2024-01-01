# docker-mvs38j
Build new Docker image with MVS TK5 and c3270 using the shell script

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

Example of a running MVS Container and c3270 emulator, started as described above
![mvs-c3270](https://github.com/MortenHarding/docker-mvs38j/assets/83698635/585dba67-1761-42cd-bc9a-3ae73aa7fa01)


## References

The following software packages are used in the container.
- [MVS Turn Key 5](https://www.prince-webdesign.nl/index.php/software/mvs-3-8j-turnkey-5) - by Rob Prince
- [c3270](https://x3270.miraheze.org/wiki/C3270) - 3270 emulator for Linux
