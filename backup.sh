#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

docker-compose exec -T mysql mysqldump -uhotcrp -photcrppwd hotcrp > greenlightBackup.sql