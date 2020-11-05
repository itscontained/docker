#!/bin/bash

if [ ! -f "/config/credentials.json" ]; then
    echo INFO: No credentials.json found. Creating empty one at /config/credentials.json
    cp /app/credentials.json.example /config/credentials.json
fi

if [ ! -f "/config/db.sqlite3" ]; then
    echo INFO: Initial migration
    python3 /app/manage.py migrate
    python3 /app/manage.py createsuperuser --noinput \
                           --username itscontained \
                           --email itscontained@email.com
fi

echo INFO: Checking for migrations
python3 /app/manage.py makemigrations

echo INFO: Migrating if needed
python3 /app/manage.py migrate

python3 /app/manage.py runserver --pythonpath /app 0.0.0.0:8000
