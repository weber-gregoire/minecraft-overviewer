#!/bin/bash
set -o errexit

echo "Removing old cronjob instance if it already exists"
crontab -l | grep -v "generate-map.sh" | crontab -
crontab -l | grep -v "update-poi.sh" | crontab -
echo "Creating new cronjob for autosave"
crontab -l | { cat; echo "0 * * * * /home/minecraft/scripts/generate-map.sh >> /home/minecraft/cron.log 2>&1"; } | crontab -
crontab -l | { cat; echo "*/5 * * * * /home/minecraft/scripts/update-poi.sh >> /home/minecraft/cron.log 2>&1"; } | crontab -
echo "Cron job initialized"

# /home/minecraft/scripts/generate-map.sh

cron -f