# Greenlight HotCRP on Docker

This repository contains scripts and a guide to install docker containers for a hotcrp installation for the KAIST ID GreenLight presentation.

## Getting started

0. Ensure you have [Docker Compose, version 2](https://docs.docker.com/compose/release-notes/), which is shipped with, e.g., recent versions of Docker Desktop.

1. Clone this repository:

```
  git clone https://github.com/makinteract/greenlight-hotcrp-on-docker
  cd hotcrp-on-docker
```

2. Clone the HotCRP repository into the app directory:

```
  git clone https://github.com/kohler/hotcrp app
```

3. If these folders were alreayd there remember to `git pull` from both.

4. Set up the database using the initial settings or the default settings.

```
    chmod +x setup
    ./setup.sh greenlightBackup.sql
    # or for the default
    ./setup.sh
```

5. You can start the server with `docker compose up -d` and then shot it down with `docker compose down` from now on.

6. Open `localhost` in a webbrowser and add your account. The port served is 80, but you can change in the docker-compose.yaml file.

7. For backup.

```
    chmod +x backup.sh
    ./backup.sh
```

6. At the bottom of the page, send account information to your account. You should receive an email. If not, check the log of the mail server:

```
docker compose exec smtp /bin/ls /var/log/maillog
```

## HTTPS

## Note

To login with mosh

```sh
mosh -p 60050:60060 root@<YOUR_IP>
```
