#!/bin/bash

if [ ! -f "/config/credentials.json" ]; then
    echo INFO: No credentials.json found. Creating empty one at /config/credentials.json
    cp /app/credentials.json.example /config/credentials.json
fi

jq
if [ ! -f "/config/db.sqlite3" ]; then
    echo INFO: Initial migration
    python3 /app/manage.py migrate
    python3 /app/manage.py createsuperuser --noinput \
                           --username itscontained \
                           --email itscontained@email.com
fi

config=$(cat /config/credentials.json)

if [ -n "$TMDB_KEY" ]; then
    echo INFO: TMDB_KEY overridden by environment variable
    config=$(echo "$config" | jq --arg v "$TMDB_KEY" '.tmdb_key=$v')
fi

if [ -n "$SONARR_URL" ]; then
    echo INFO: SONARR_URL overridden by environment variable
    config=$(echo "$config" | jq --arg v "$SONARR_URL" '.sonarr_url=$v')
fi

if [ -n "$SONARR_KEY" ]; then
    echo INFO: SONARR_KEY overridden by environment variable
    config=$(echo "$config" | jq --arg v "$SONARR_KEY" '.sonarr_key=$v')
fi

if [ -n "$RADARR_URL" ]; then
    echo INFO: RADARR_URL overridden by environment variable
    config=$(echo "$config" | jq --arg v "$RADARR_URL" '.radarr_url=$v')
fi

if [ -n "$RADARR_KEY" ]; then
    echo INFO: RADARR_KEY overridden by environment variable
    config=$(echo "$config" | jq --arg v "$RADARR_KEY" '.radarr_key=$v')
fi

echo "$config" > /config/credentials.json

echo INFO: Checking for migrations
python3 /app/manage.py makemigrations

echo INFO: Migrating if needed
python3 /app/manage.py migrate

python3 /app/manage.py runserver --pythonpath /app 0.0.0.0:8000
