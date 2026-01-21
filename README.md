# Greenlight HotCRP on Docker

This repository contains scripts and a guide to install Docker containers for a HotCRP installation for the KAIST ID GreenLight presentation.

## Getting started

0. Ensure you have [Docker Compose, version 2](https://docs.docker.com/compose/release-notes/), which is shipped with, e.g., recent versions of Docker Desktop.

1. Clone this repository:

```
  git clone https://github.com/makinteract/greenlight-hotcrp-on-docker
  cd greenlight-hotcrp-on-docker
```

2. Clone the HotCRP repository into the app directory:

```
  git clone https://github.com/kohler/hotcrp app
```

3. If these folders were already there, remember to `git pull` from both.

4. Set up the database using the initial settings or the default settings.

```
    chmod +x setup.sh
    ./setup.sh greenlightBackup.sql
    # or for the default
    ./setup.sh
```

5. You can start the server with `docker compose up -d` and then shut it down with `docker compose down` from now on.

6. Open `localhost` in a web browser and add your account. The port served is 80, but you can change it in the docker-compose.yaml file.

7. For backup:

```
    chmod +x backup.sh
    ./backup.sh
```

8. At the bottom of the page, send account information to your account. You should receive an email. If not, check the log of the mail server:

```
docker compose exec smtp /bin/ls /var/log/maillog
```

## Domain and HTTPS

Use your provider and point your domain to the server.

Let's assume your domain is `green.designware.xyz`.

Check that you can access `http://green.designware.xyz`. You may also want to use dig for checking the DNS (`dig green.designware.xyz.`).

Once the DNS has been resolved, we can focus on routing the traffic over HTTPS.

Modify your **Caddy** file in the first line to include the correct domain.

Run this to start 'caddy' with Docker:

```
docker compose -f docker-compose.ssl.yaml up -d
```

and you can inspect the logs this way:

```
docker compose -f docker-compose.ssl.yaml logs -f caddy
```

To stop the server, use `docker compose down`.

If you need to completely remove caddy data, do this:

```
docker volume ls
```

and you should see a volume with _<name>\_caddy_data_, for example _greenlight-hotcrp-on-docker_caddy_data_.

Then you can remove the caddy data and retry from scratch by running this command (ensure that the server is down first):

```
docker volume rm greenlight-hotcrp-on-docker_caddy_data
```

## Note

To login with mosh:

```sh
mosh -p 60050:60060 root@<YOUR_IP>
```
