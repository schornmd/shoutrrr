#!/bin/bash

find ./cron -type f -exec chmod 644 {} \;
docker compose up -d