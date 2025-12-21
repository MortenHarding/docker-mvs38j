# How to MUSIC/SP and c3270 

Before you can login to MUSIC/SP you have to run IPL

### Prerequisites

Before you can IPL the system, you will have to open a telnet connection to the Hercules console port and attach to the Hercules emulator.

* The Hercules console port
Connect a telnet client to port 3270. You can use your own telnet client or the client in the docker container.
Using your own client `telnet localhost 3270`
Using the container client `docker exec -it music telnet localhost 3270`

* The Hercules emulator.
Connect to the Hercules emulator using `docker attach --detach-keys="ctrl-x" music`

### IPL MUSIC/SP

* In the Hercules emulator, run `IPL 201`

* In the telnet session, press Enter in response to the message "M077 Enter operator id or special options or HELP".

After a few seconds MUSIC/SP is started and you can connect using a tn3270 client or the client that comes with the container.

* Open c3270 and connect to MUSIC/SP 
`docker exec -it music ./tn3270`

Or use [Connect to all MVS TurnKey installations](#connect-to-all-mvs-turnkey-installations)

## c3270 basic commands

* Clear the screen press
`Ctrl + c`

* Drop down menu
`Ctrl + n`

![c3270-dropdwn](https://github.com/MortenHarding/docker-mvs38j/blob/main/assets/c3270-dropdown-menu.png?raw=trueg)