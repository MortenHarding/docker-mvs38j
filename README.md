# MVS Docker containers

- [MVS TurnKey installations](#mvs-docker-containers)
- [This Repo](#this-repo)
  - [The benefit of this Repo](#the-benefit-of-this-repo)
  - [Prerequisites](#Prerequisites)
- [Quick start guide](#Quick-start-guide)
  - [Install the prerequisites](#install-the-prerequisites)
  - [Start all MVS TurnKey installations](#Start-all-MVS-TurnKey-installations)
  - [Connect to all MVS TurnKey installations](#connect-to-all-mvs-turnkey-installations)
  - [Stop all MVS TurnKey installations](#stop-all-mvs-turnkey-installations)
- [Detailed description](#detailed-description)
  - [Start all containers](#start-all-containers)
  - [Start a single container](#start-a-single-container)
  - [Stop and remove a single container](#stop-and-remove-a-single-container)
  - [Stop all containers](#stop-all-containers)
  - [How to connect](#how-to-connect)
    - [Connect to MVS in all containers using the included c3270](#connect-to-mvs-in-all-containers-using-the-included-c3270)
    - [Access MVS using tn3270](#access-mvs-using-tn3270)
    - [Access the Hercules Console](#access-the-hercules-console)
    - [Access Hercules HTTP server](#access-hercules-http-server)
    - [Usernames and Passwords](#usernames-and-passwords)
  - [Container ports and mappings](#container-ports-and-mappings)
    - [Container names](#container-names)
    - [Port mapping](#port-mappings)
    - [Volume mapping](#volume-mapping)
- [References](#References)

# MVS TurnKey installations

The Docker Containers in this repo contain MVS installations, created and built by 
briliant gentlemen in the mainframe community. Without these MVS TurnKey installations, 
most of us would never get the pleasure of using MVS. 
All credit for the MVS TurnKey installations goes to these briliant MVS experts.

**Thank you for all your work and contributions.**

For a list of the Turnkey installations, please go to the [References](#References) section
at the end of this page.


# This Repo

The containers that can be provisioned using the code in this repo include the [MVS TurnKey installations](#References), plus additional software, such as the latest release of [Hercules](https://hercules-390.github.io/html/), [Zellij](https://zellij.dev/documentation/) and [c3270](https://x3270.miraheze.org/wiki/C3270), making it possible to start one or more MVS TurnKey installations and connect using tn3270 without requirering anything but Docker.

## The benefit of this Repo 

Using Docker compose and the [compose.yml](https://github.com/MortenHarding/docker-mvs38j/blob/main/compose.yml) file from this repo, 
you can:
 * Start all MVS TurnKey installations using one command
 * Login to MVS using [Zellij](https://zellij.dev/documentation/) and [c3270](https://x3270.miraheze.org/wiki/C3270) emulator.
 * Access the Hercules console 


## Prerequisites

* [Docker](https://www.docker.com/get-started)
* [compose.yml](https://github.com/MortenHarding/docker-mvs38j/blob/main/compose.yml). This is the only file required from github repo [docker-mvs38j](https://github.com/MortenHarding/docker-mvs38j)

# Quick start guide

## Install the prerequisites

* Install [Docker](https://www.docker.com/get-started). 
* Download [compose.yml](https://github.com/MortenHarding/docker-mvs38j/blob/main/compose.yml) into an empty directory.

## Start all MVS TurnKey installations

* Run the following command from the directory containing [compose.yml](https://github.com/MortenHarding/docker-mvs38j/blob/main/compose.yml). [(Note 1)](#note-1)

```sh
docker compose up -d
```

This will pull the container images from [hub.docker.com](https://hub.docker.com/r/mhardingdk/mvs) 
and start a container for each of the MVS TurnKey installations.

![docker compose up -d](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/docker-compose-up.jpeg?raw=true)

## Connect to all MVS TurnKey installations

* Run the following command to connect to MVS using [Zellij](https://zellij.dev/documentation/) and the [c3270](https://x3270.miraheze.org/wiki/C3270) emulator. [c3270 How to...](VM370.md#c3270-basic-commands)

```sh
docker exec -it ce ./zel3270
```

Press `Ctrl + T` and use left and right arrow keys to switch tabs. 

![All TN3270 connections](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/zellij.png?raw=true)

## Stop all MVS TurnKey installations


```sh
docker compose down
```

This will stop and remove the containers. [(Note 2)](#note-2)

# Detailed description

## Start all containers

* Run the following command from the directory containing [compose.yml](https://github.com/MortenHarding/docker-mvs38j/blob/main/compose.yml). [(Note 1)](#note-1)

```sh
docker compose up -d
```

This will pull the container images from [hub.docker.com](https://hub.docker.com/r/mhardingdk/mvs) 
and start a container for each of the MVS TurnKey installations in this repo, 
which includes `VM370, TK4, tk5upd3, MVS/CE`.

![docker compose up -d](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/docker-compose-up.jpeg?raw=true)

#### Note 1 
Use the `-f` argument, to point to [compose.yml](https://github.com/MortenHarding/docker-mvs38j/blob/main/compose.yml) file, if it isn't in the current directory. 
E.g. if compose.yml is in your home directory `docker compose -f ~/compose.yml up -d`

## Start a single container

To start a single container use the commands described below.

For example if you'd like to start MVS tk5upd3 use:

```sh
docker compose up -d tk5upd3
```

The following example shows a single MVS Container tk5upd3 and c3270 emulator. 
 * The container is started as described in the above command 
 * c3270 is accessed as described in [Access MVS using tn3270](#access-mvs-using-tn3270) 
 * The Hercules console is accessed as described in [Access the Hercules console](#access-the-hercules-console).

![mvs-c3270](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/mvs-c3270.jpeg?raw=true)

## Stop and remove a single container

Stop and remove a single container

```sh
docker compose down tk5upd3
```

## Stop all containers

* Run the following command.

```sh
docker compose down
```

This will stop and remove the containers. [(Note 2)](#note-2)

#### Note 2 
The subdirectories created during `docker compose up` by [volume mapping](#volume-mapping) will not be removed.

## How to connect

## Connect to MVS in all containers using the included c3270

The containers include [Zellij](https://zellij.dev/documentation/), a terminal multiplexer, that has been configured to open a 3270 connection to all included containers.

* Run the following command to access MVS using [Zellij](https://zellij.dev/documentation/) and the included c3270 emulator. [c3270 How to...](VM370.md#c3270-basic-commands)

```sh
docker exec -it ce ./zel3270
```

This will start [Zellij](https://zellij.dev/documentation/) and open the c3270 emulator in the container named `ce`, with connections to MVS in all containers, and make `ce` the active connection.

Press `Ctrl + T` and use left and right arrow keys to switch between tabs. 

In the command example `ce` is the name of the docker container, this container name
can be changed to another container name listed in [Container naming](#container-naming), to have a different active connection at startup.

![All TN3270 connections](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/zellij.png?raw=true)


### Access MVS using tn3270

Access any of the MVS TurnKey installations that are started, using
the included c3270, with the command below. [c3270 How to...](VM370.md#c3270-basic-commands)

Change the Container name `ce` to one of the names listed in [Container naming](#container-naming)

```sh
docker exec -it ce ./tn3270
```

Access any of the MVS TurnKey installations that are started using your own tn3270
emulator, by connecting to `localhost:port`. Change the port number to the number
listed in [Port mappings](#port-mappings).

```sh
./your-own-tn3270-emulator localhost:3270
```

## Access the Hercules Console

* Run the following command to access the Hercules console for MVS/CE.

```sh
docker attach ce
```

In the command example `ce` is the name of the docker container, the name
can be changed to another container name listed in [Container naming](#container-naming), to get access to the Hercules console for any of the MVS TurnKey installations running in the containers.

![hercules console](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/hercules-console.jpeg?raw=true)

### Access Hercules HTTP server

Access the Hercules HTTP server for any of the MVS TurnKey installations, using a web browser, by connecting to localhost:port, by changing the port number to the number listed in [Port mappings](#port-mappings).

```sh
http://localhost:8880
```

### Usernames and passwords

| Name      | Username  | Pwd      | Type                 |
|:----------|:----------| --------:|:---------------------|
| **mts**   | MTS       | aardvarks| [How to...](#note-4) |
|           | ST01      | ST01     |                      |
| **vm370** | CMSUSER   | CMSUSER  | [How to...](VM370.md#how-to-vm370-dosvs-and-c3270)            |
|           | KICKS     | KICKS    | CMS                  |
| **tk4**   | HERC01    | CUL8TR   | TSO                  |
|           | HERC02    | CUL8TR   | TSO                  |
|           | HERC03    | PASS4U   | TSO                  |
|           | HERC04    | PASS4U   | TSO                  |
|           | IBMUSER   | IBMPASS  | TSO                  |
|**tk5upd3**| HERC01    | CUL8TR   | TSO                  |
|           | HERC02    | CUL8TR   | TSO                  |
|           | HERC03    | PASS4U   | TSO                  |
|           | HERC04    | PASS4U   | TSO                  |
|  **ce**   | IBMUSER   | SYS1     | TSO                  |
|           | MVSCE01   | CUL8TR   | TSO                  |
|           | MVSCE02   | PASS4U   | TSO                  |
|           | HERCULES  | HERCULES | Hercules http server |


## Container ports and mappings

### Container names

| Container |                                    |
|:----------|------------------------------------|
| **mts**   | Must be ipl'ed  [(Note 4)](#note-4)|
| **vm370** | Includes DOS/VS [(Note 3)](#note-3)|
| **tk4**   |                                    |
|**tk5upd3**|                                    |
| **ce**    |                                    |

#### Note 3 
[DOS/VS](http://www.vm370.org/dos) is included in the vm370 container and the Hercules config file, vm370ce.conf have entries for the DOS/VS devices.

#### Note 4
[MTS](https://try-mts.com/up-and-running-2-booting-the-system/) must be manually ipl'ed as described in the link.

### Port mappings

| Name/port | Container | Host  |                      |
|:----------|----------:| -----:|:---------------------|
| **mts**   | 3270      | 3275  | tn3270               |
|           | 8081      | 8885  | Hercules http server |
| **vm370** | 3270      | 3274  | tn3270               |
|           | 8081      | 8884  | Hercules http server |
| **tk4**   | 3270      | 3273  | tn3270               |
|           | 8038      | 8883  | Hercules http server |
|**tk5upd3**| 3270      | 3271  | tn3270               |
|           | 8038      | 8881  | Hercules http server |
|  **ce**   | 2120      |   21  | FTPD Server          |
|           | 2320      |   23  | Encrypted TN3270     |
|           | 3270      | 3270  | tn3270               |
|           | 3505      | 3505  | ASCII JES2 listener  |
|           | 3506      | 3508  | EBCDIC JES2 listener |
|           | 8888      | 8880  | Hercules http server |


## Volume mapping

The subdirectories in column `Host directory` will be created in the directory, where `docker compose up -d` is executed. These directories will give you access to logs, disks printer output, included documentation and config files. If you do not want the folders created on your host, edit the `compose.yml` file and remove the section named `volumes:`.

| Name      | Host directory       | Container  |
|:----------| :--------------------|:-----------|
| **mts**   | ./mts/config         | /conf      |
|           | ./mts/log            | /log       |
|           | ./mts/doc            | /doc       |
|           | ./mts/dasd           | /Disks     |
|           | ./mts/units          | /Units     |
|           | ./mts/tapes          | /Tapes     |
| **vm370** | ./vm370/config       | /conf      |
|           | ./vm370/log          | /log       |
|           | ./vm370/doc          | /doc       |
|           | ./vm370/dasd         | /disks     |
|           | ./vm370/dosvs        | /dosvs     |
| **tk4**   | ./tk4/config         | /conf      |
|           | ./tk4/printers       | /prt       |
|           | ./tk4/punchcards     | /pch       |
|           | ./tk4/log            | /log       |
|           | ./tk4/dasd           | /dasd      |
|           | ./tk4/doc            | /doc       |
|**tk5upd3**| ./tk5upd3/config     | /conf      |
|           | ./tk5upd3/printers   | /prt       |
|           | ./tk5upd3/punchcards | /pch       |
|           | ./tk5upd3/log        | /log       |
|           | ./tk5upd3/dasd       | /dasd      |
|           | ./tk5upd3/doc        | /doc       |
|  **ce**   | ./ce/config          | /config    |
|           | ./ce/printers        | /printers  |
|           | ./ce/punchcards      | /punchcards|
|           | ./ce/logs            | /logs      |
|           | ./ce/dasd            | /dasd      |
|           | ./ce/certs           | /certs     |

# References

For detailed documentation please refer to the specific TurnKey installation documentation linked below.

The following software is used in the containers in this repo.
- [Hercules](https://hercules-390.github.io/html/) - Hercules System/370, ESA/390, and z/Architecture Emulator
- [MVS/CE](https://hub.docker.com/r/mainframed767/mvsce) - MVS/CE Docker image - By mainframed767
- [MVS Turn Key 5](https://www.prince-webdesign.nl/index.php/software/mvs-3-8j-turnkey-5) - by Rob Prins
- [MVS Turn Key 4](https://wotho.pebble-beach.ch/tk4-) - by Juergen Winkelmann
- [VM370](http://www.vm370.org) - VM/370 Community Edition
- [DOS/VS](http://www.vm370.org/dos) - DOS/VS 5pack release
- [MTS](https://try-mts.com/up-and-running-2-booting-the-system/) - Michigan Terminal System
- [c3270](https://x3270.miraheze.org/wiki/C3270) - 3270 emulator for Linux
- [Zellij](https://zellij.dev/documentation/) - Zellij terminal multiplexer
- [docker-mvs38j](https://github.com/MortenHarding/docker-mvs38j) - Github repo with docker files for building these containers

