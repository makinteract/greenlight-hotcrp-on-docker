#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Get SQL file input parameter
SQL_FILE="$1"

# Copy configuration file
cp hotcrp-options.php app/conf/options.php
echo "✓ Configuration file copied"

# Start Docker containers and wait for them to be ready
docker compose up -d
echo "Waiting for containers to be ready..."
sleep 10  # Give containers time to fully start
echo "✓ Containers started"

# Initialize database
if [ -n "$SQL_FILE" ] && [ -f "$SQL_FILE" ]; then
    # Import from SQL file
    echo "Importing database from $SQL_FILE..."
    docker-compose exec -T mysql mysql -uhotcrp -photcrppwd hotcrp < "$SQL_FILE"
    echo "✓ Database imported from SQL file"
else
    # Create new database
    echo "Creating new database..."
    docker compose exec mysql /bin/sh -c "echo 'ok\nhotcrp\nhotcrppwd\nn\nY\n' | sh /srv/www/api/lib/createdb.sh --user=root --password=root"
    echo "✓ New database created"
fi

echo "Setup complete!"
