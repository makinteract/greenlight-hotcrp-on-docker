#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Stop and remove containers
docker compose down
echo "✓ Containers stopped"

rm -Rf app
rm -Rf dbdata
rm -Rf logs
echo "✓ Application directory removed"

echo "Erase and setup complete!"