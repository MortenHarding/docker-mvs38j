# MVS Docker containers

- [MVS TurnKey installations](#MVS-TurnKey-installations)
- [This Repo MVS and c3270 emulator in one container](#This-Repo-MVS-and-c3270-emulator-in-one-container)
  - [The benefit of these containers](#The-benefit-of-these-containers)
  - [Prerequisites](#Prerequisites)
- [Quick start guide](#Quick-start-guide)
  - [Start all MVS TurnKey installations](#Start-all-MVS-TurnKey-installations)
  - [Access the MVS Console](#Access-the-MVS-Console)
  - [Connect to MVS in the container using the included c3270](#Connect-to-MVS-in-the-container-using-the-included-c3270)
  - [Start a single container](#Start-a-single-container)
- [References](#References)

# MVS TurnKey installations

The Docker Containers in this repo contain MVS installations, created and built by 
briliant gentlemen in the mainframe world. Without these MVS TurnKey installations, 
most of us would never get the pleasure of using MVS. 
All credit for the MVS TurnKey installations goes to these briliant MVS experts.

Thank you for all your work and contributions.

For a list of the Turnkey installations, please go to the [References](#References) section
at the end of this page.


# This Repo MVS and c3270 emulator in one container

The containers in this repo include the MVS TurnKey installations, plus 
additional software, such as the latest release of Hercules/Hyperion and c3270,
making it possible to start one or more MVS TurnKey installations and connect using 3270 without
requirering anything but Docker.

## The benefit of these containers 

Using Docker compose and the [docker-compose.yaml](https://github.com/MortenHarding/docker-mvs38j/blob/main/docker-compose.yaml) file from this repo, 
you can start all MVS TurnKey installations using one command and
access the MVS console or login to MVS, using Docker and c3270.

## Prerequisites

[Docker and Docker compose](https://www.docker.com/get-started) must be installed

# Quick start guide

Install Docker including Docker compose and download [docker-compose.yaml](https://github.com/MortenHarding/docker-mvs38j/blob/main/docker-compose.yaml).

## Start all MVS TurnKey installations

Check that the docker-compose.yaml file is in the current directory, and run the following command.
Or use the '-f' argument to point to the location of the docker-compose.yaml file:

```sh
docker compose up -d
```

This will pull the container images from https://hub.docker.com/r/mhardingdk/mvs 
and start one container for each of the MVS TurnKey installations in this repo, 
which includes VM370, TK4, TK5, TK5upd2, MVS/CE.

![docker compose up -d](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/docker-compose-up.jpeg?raw=true)
 
## Access the MVS Console

Using the following command the MVS console for MVS/CE is opened.

```sh
docker attach ce
```

In the command example "ce" is the name of the docker container, the name
can be changed to another container name to get access to the MVS console for
any of the MVS TurnKey installations running in the containers.

![hercules console](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/hercules-console.jpeg?raw=true)


## Connect to MVS in the container using the included c3270

```sh
docker exec -it ce ./tn3270
```

This will start the c3270 emulator in the container named "ce". 

In the command example "ce" is the name of the docker container, the name
can be changed to another container name to start c3270 and connect to
any of the MVS TurnKey installations running in the containers.

![MVS/CE logon](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/mvsce-logon.jpeg?raw=true)


## Start a single container

If you prefer to only start a single MVS TurnKey installation, you can run
this command.

```sh
docker run -it --name myMVS -p 3270:3270/tcp mhardingdk/mvs
```

MVS/CE is currently tagged as "latest", hence it is not necessary
to use the tag "ce" since it's the default.


If you want a different TurnKey installation, use any of the other container tags.
For example if you'd like to start MVS TK4 use:

```sh
docker run -it --name myMVS -p 3270:3270/tcp mhardingdk/mvs:tk4
```

The following example shows a single MVS Container and c3270 emulator, started as described above
![mvs-c3270](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/mvs-c3270.jpeg?raw=true)

# References

For usernames and passwords please refer to the specific TurnKey installation
documentation that is linked below.

The following software is used in the containers in this repo.
- [Hercules](https://hercules-390.github.io/html/) - Hercules System/370, ESA/390, and z/Architecture Emulator
- [MVS/CE](https://hub.docker.com/r/mainframed767/mvsce) - MVS/CE Docker image
- [MVS Turn Key 5](https://www.prince-webdesign.nl/index.php/software/mvs-3-8j-turnkey-5) - by Rob Prins
- [MVS Turn Key 4](https://wotho.pebble-beach.ch/tk4-) - by Juergen Winkelmann
- [c3270](https://x3270.miraheze.org/wiki/C3270) - 3270 emulator for Linux
- [docker-mvs38j](https://github.com/MortenHarding/docker-mvs38j) - Github repo with docker files for building these containers

