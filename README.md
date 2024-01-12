# MVS Docker containers

- [MVS TurnKey installations](#mvs-docker-containers)
- [This Repo](#this-repo)
  - [The benefit of this Repo](#the-benefit-of-this-repo)
  - [Prerequisites](#Prerequisites)
- [Quick start guide](#Quick-start-guide)
  - [Install the prerequisites](#install-the-prerequisites)
  - [Start all MVS TurnKey installations](#Start-all-MVS-TurnKey-installations)
  - [Access the MVS Console](#Access-the-MVS-Console)
  - [Connect to MVS in the container using the included c3270](#Connect-to-MVS-in-the-container-using-the-included-c3270)
- [Detailed description](#detailed-description)
  - [Start a single container](#Start-a-single-container)
    - [Start the default container MVS/CE](#start-the-default-container-mvsce)
    - [Start a non default container](#start-a-non-default-container)
  - [How to connect](#how-to-connect)
    - [Access MVS using tn3270](#access-mvs-using-tn3270)
    - [Access Hercules HTTP server](#access-hercules-http-server)
  - [Container ports and mappings](#container-ports-and-mappings)  
    - [Port mapping](#port-mappings)
    - [Volume mapping](#volume-mapping)
- [References](#References)

# MVS TurnKey installations

The Docker Containers in this repo contain MVS installations, created and built by 
briliant gentlemen in the mainframe world. Without these MVS TurnKey installations, 
most of us would never get the pleasure of using MVS. 
All credit for the MVS TurnKey installations goes to these briliant MVS experts.

**Thank you for all your work and contributions.**

For a list of the Turnkey installations, please go to the [References](#References) section
at the end of this page.


# This Repo

The containers that can be provisioned using the code in this repo include the MVS TurnKey installations, 
plus additional software, such as the latest release of Hercules/Hyperion and c3270,
making it possible to start one or more MVS TurnKey installations and connect using 3270 without
requirering anything but Docker.

## The benefit of this Repo 

Using Docker compose and the [compose.yml](https://github.com/MortenHarding/docker-mvs38j/blob/main/compose.yml) file from this repo, 
you can start all MVS TurnKey installations using one command and
access the MVS console or login to MVS, using Docker and c3270.

## Prerequisites

[Docker and Docker compose](https://www.docker.com/get-started) must be installed

# Quick start guide

## Install the prerequisites

* Install Docker including Docker compose. 
* download [compose.yml](https://github.com/MortenHarding/docker-mvs38j/blob/main/compose.yml) into an empty directory.

## Start all MVS TurnKey installations

* Run the following command.

```sh
docker compose up -d
```

NOTE: Use the `-f` argument in the command to point to compose.yml file, if it isn't in the current directory.

This will pull the container images from https://hub.docker.com/r/mhardingdk/mvs 
and start one container for each of the MVS TurnKey installations in this repo, 
which includes `VM370, TK4, TK5, TK5upd2, MVS/CE`.

![docker compose up -d](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/docker-compose-up.jpeg?raw=true)
 
## Access the MVS Console

Using the following command the MVS console for MVS/CE is opened.

```sh
docker attach ce
```

In the command example `ce` is the name of the docker container, the name
can be changed to another container name to get access to the MVS console for
any of the MVS TurnKey installations running in the containers.

![hercules console](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/hercules-console.jpeg?raw=true)


## Connect to MVS in the container using the included c3270

```sh
docker exec -it ce ./tn3270
```

This will start the c3270 emulator in the container named `ce`. 

In the command example `ce` is the name of the docker container, the name
can be changed to another container name to start c3270 and connect to
any of the MVS TurnKey installations running in the containers.

![MVS/CE logon](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/mvsce-logon.jpeg?raw=true)

# Detailed description

## Start a single container

### Start the default container MVS/CE

If you prefer to only start a single MVS TurnKey installation, you can run
this command.

```sh
docker run -it --name myMVS -p 3270:3270/tcp mhardingdk/mvs
```

MVS/CE is currently tagged as `latest`, hence it is not necessary
to use the tag "ce" since it's the default.

### Start a non default container

If you want a different TurnKey installation, use any of the other container tags.
For example if you'd like to start MVS TK4 use:

```sh
docker run -it --name myMVS -p 3270:3270/tcp mhardingdk/mvs:tk4
```

The following example shows a single MVS Container and c3270 emulator, started as described above.

![mvs-c3270](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/mvs-c3270.jpeg?raw=true)

## How to connect

### Access MVS using tn3270

Access any of the MVS TurnKey installations that are started, using
the included c3270, with the following command.
Change the Container name `ce` to one of the names listed in [Container naming](#container-naming)

```sh
docker exec -it ce ./tn3270
```

Access any of the MVS TurnKey installations that are started using your own tn3270
emulator, by connecting to `localhost:port`, by changing the port number to the number
listed in [Port mappings](#port-mappings), column | host | tn3270.

```sh
./tn3270 localhost:3270
```

### Access Hercules HTTP server

Access the Hercules HTTP server for any of the MVS TurnKey installations, using a web browser, by connecting to localhost:port, by changing the port number to the number listed in [Port mappings](#port-mappings) column |host| Hercules http server-

```sh
http://localhost:8880
```

## Container ports and mappings

### Container naming

| Container | 
| ---------:|
| **vm370** |
| **tk4**   |
| **tk5**   |
|**tk5upd2**|
| **ce**    |

### Port mappings

| Name/port | Container | Host  |                      |
| ---------:|----------:| -----:|:---------------------|
| **vm370** | 3270      | 3274  | tn3270               |
|           | 8081      | 8884  | Hercules http server |
| **tk4**   | 3270      | 3273  | tn3270               |
|           | 8038      | 8883  | Hercules http server |
| **tk5**   | 3270      | 3272  | tn3270               |
|           | 8038      | 8882  | Hercules http server |
|**tk5upd2**| 3270      | 3271  | tn3270               |
|           | 8038      | 8881  | Hercules http server |
|  **ce**   | 2120      |   21  | FTPD Server          |
|           | 2320      |   23  | Encrypted TN3270     |
|           | 3270      | 3270  | tn3270               |
|           | 3505      | 3505  | ASCII JES2 listener  |
|           | 3506      | 3508  | EBCDIC JES2 listener |
|           | 8888      | 8880  | Hercules http server |


## Volume mapping

# References

For usernames and passwords please refer to the specific TurnKey installation
documentation that is linked below.

The following software is used in the containers in this repo.
- [Hercules](https://hercules-390.github.io/html/) - Hercules System/370, ESA/390, and z/Architecture Emulator
- [MVS/CE](https://hub.docker.com/r/mainframed767/mvsce) - MVS/CE Docker image - By mainframed767
- [MVS Turn Key 5](https://www.prince-webdesign.nl/index.php/software/mvs-3-8j-turnkey-5) - by Rob Prins
- [MVS Turn Key 4](https://wotho.pebble-beach.ch/tk4-) - by Juergen Winkelmann
- [c3270](https://x3270.miraheze.org/wiki/C3270) - 3270 emulator for Linux
- [docker-mvs38j](https://github.com/MortenHarding/docker-mvs38j) - Github repo with docker files for building these containers

