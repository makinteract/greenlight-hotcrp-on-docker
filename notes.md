0. Ensure you have [Docker Compose, version 2](https://docs.docker.com/compose/release-notes/), which is shipped with, e.g., recent versions of Docker Desktop.

1. Clone this repository:

```
  git clone https://github.com/makinteract/hotcrp-on-docker
  cd hotcrp-on-docker
```

2. Clone the HotCRP repository into the app directory:

```
  git clone https://github.com/kohler/hotcrp app
```

3. Set up the database using the initial settings or the default settings.

```
    chmod +x setup
    ./setup.sh greenlightBackup.sql
    # or for the default
    ./setup.sh
```

4. Open `localhost:9001` in a webbrowser and add your account.

5. For backup.

```
    chmod +x backup.sh
    ./backup.sh
```
