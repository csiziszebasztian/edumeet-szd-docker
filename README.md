# eduMEET in Docker container

Docker hub repository: [edumeet/edumeet](https://hub.docker.com/r/edumeet/edumeet)

This is the container, or a "dockerized" version of the [edumeet-szd](https://github.com/csiziszebasztian/edumeet-szd).

## Run it in few easy steps

1. Git clone this code to your docker machine.

2. Run once `creat-config.sh` which will download current.

3. Set the configurations. Use the settings in the thesis. 

## Install docker-compose

Installation in Debian/Ubuntu environment. For other environments, please visit the official site.

Installing `docker-compose`:

```sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```
## Run

1. Run with `docker-compose` 
/ [install docker compose](https://docs.docker.com/compose/install/) /

```sh
  $ sudo docker-compose up --detach
```
- edumeet and redis images will be pooled from Docker hub
- **note**: to enable automatic Docker images update, uncomment `ouroboros` configuration in `docker-compose.yml`

2. Test your service in a webRTC enabled browser: `https://yourDomainOrIPAdress/443`

3. If you see "Warning: Potential Security Risk Ahead" click on the "Advanced..." button and click on the "Accept the Risk and Continue" button. 

4. If you cannot enter one of the rooms, you can right-click in your browser. Select "inspectet" or "devtools". Here look for the console. In the console you will see error messages like this: "The Same Origin Policy disallows...". Click on the error link. Accept the threat again here. Return to the page of the currently running edumeet and enter the room.

## Rebuild

To rebuild edumeet docker image (eg. change in .env) use following command:

```sh
  $ sudo docker-compose -f docker-compose-build.yml build
```

## 2 Docker networking

Container works in "host" network mode, because bridge mode has the following issue: ["Docker hangs when attempting to bind a large number of ports"](https://success.docker.com/article/docker-compose-and-docker-run-hang-when-binding-a-large-port-range)

## Further Informations

Read more about configs and settings in [eduMEET](https://github.com/edumeet/edumeet) README.

