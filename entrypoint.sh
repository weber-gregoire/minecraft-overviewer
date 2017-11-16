#!/bin/bash
set -o errexit

echo "Removing old cronjob instance if it already exists"
crontab -l | grep -v "generate-map.sh" | crontab -
echo "Creating new cronjob for autosave"
crontab -l | { cat; echo "* * * * * /home/minecraft/generate-map.sh >> /home/minecraft/generation.log 2>&1"; } | crontab -
echo "Cron job initialized"
service cron start

# move into the rendered map folder
cd /home/minecraft/render

# start simple http server
python -m SimpleHTTPServer 8080
