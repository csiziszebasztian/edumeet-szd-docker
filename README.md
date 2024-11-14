# eduMEET in Docker container

Docker hub repository: [edumeet/edumeet](https://hub.docker.com/r/edumeet/edumeet)

This is the container, or a "dockerized" version of the [edumeet-szd](https://github.com/csiziszebasztian/edumeet-szd).

Tested on Ubuntu 20.04 LTS, Ubuntu 24.04 LTS and Windows 11 with Docker engine. Containers are inaccessible on Windows 11 with Docker desktop. If you know a workaround for this problem you can use it.

## Run it in few easy steps

Git clone this code to your docker machine.

## Install docker engine & docker compose

Installation in Debian/Ubuntu environment. More information in the [official site](https://www.docker.com/). 

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
## Run

1. Run with `docker compose` 

```sh
  $ sudo docker compose up -d --remove-orphans
```
- edumeet and redis images will be pooled from Docker hub

2. Test your service in a webRTC enabled browser: `https://yourDomainOrIPAdress`

3. If you see "Warning: Potential Security Risk Ahead" click on the "Advanced..." button and click on the "Accept the Risk and Continue" button. 

4. If you cannot enter one of the rooms, you can right-click in your browser. Select "inspectet" or "devtools". Here look for the console. In the console you will see error messages like this: "The Same Origin Policy disallows...". Click on the error link. Accept the threat again here. Return to the page of the currently running edumeet and enter the room.

## Rebuild

To rebuild edumeet docker image (eg. change in .env) use following command:

```sh
  $ sudo docker compose -f docker-compose-build.yml build
```

## 2 Docker networking

Container works in "host" network mode, because bridge mode has the following issue: ["Docker hangs when attempting to bind a large number of ports"](https://success.docker.com/article/docker-compose-and-docker-run-hang-when-binding-a-large-port-range)

## Further Informations

Read more about configs and settings in [eduMEET](https://github.com/edumeet/edumeet) README.