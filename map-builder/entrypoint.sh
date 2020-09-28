#!/bin/bash -ex

echo "Removing old cronjob instance if it already exists"
crontab -l | grep -v "generate-map.sh" | crontab -
crontab -l | grep -v "update-poi.sh" | crontab -
echo "Creating new cronjob for autosave"
crontab -l | { cat; echo "${MAP_GENERATION_FREQUENCY} /home/minecraft/scripts/generate-map.sh >> /home/minecraft/cron.log 2>&1"; } | crontab -
crontab -l | { cat; echo "${POI_REFRESH_FREQUENCY} /home/minecraft/scripts/update-poi.sh >> /home/minecraft/cron.log 2>&1"; } | crontab -
echo "Cron job initialized"

echo "Starting initial map generation..."
/home/minecraft/scripts/generate-map.sh
/home/minecraft/scripts/update-poi.sh
cron -f
