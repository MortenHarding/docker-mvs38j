## _MVS 3.8j and c3270 emulator in one container_

How to start a container with MVS 3.8j using the latest image, which currently is MVS/CE

```sh
docker run -it --name myMVS -p 3270:3270/tcp mhardingdk/mvs
```

If you want an older version, use the tags. E.g. for TK4 use
```sh
docker run -it --name myMVS -p 3270:3270/tcp mhardingdk/mvs:tk4
```


How to connect to MVS in the container using the included c3270 emulator

```sh
docker exec -it myMVS c3270 localhost:3270
```

Default username and password is 'herc01' and 'cul8tr'

Example of a running MVS Container and c3270 emulator, started as described above
![mvs-c3270](https://github.com/MortenHarding/docker-mvs38j/assets/83698635/585dba67-1761-42cd-bc9a-3ae73aa7fa01)

## References

The following software packages are used in the containers in this repo.
- [Hercules](https://hercules-390.github.io/html/) - Hercules System/370, ESA/390, and z/Architecture Emulator
- [MVS/CE](https://hub.docker.com/r/mainframed767/mvsce) - MVS/CE Docker image
- [MVS Turn Key 5](https://www.prince-webdesign.nl/index.php/software/mvs-3-8j-turnkey-5) - by Rob Prins
- [MVS Turn Key 4](https://wotho.pebble-beach.ch/tk4-) - by Juergen Winkelmann
- [c3270](https://x3270.miraheze.org/wiki/C3270) - 3270 emulator for Linux

