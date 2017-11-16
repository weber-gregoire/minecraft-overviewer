#!/bin/bash
set -o errexit

cp /home/minecraft/index.html /home/minecraft/render/index.html

# Require MINECRAFT_VERSION environment variable to be set (no default assumed)
if [ -z "$MINECRAFT_VERSION" ]; then
  echo "Expecting environment variable MINECRAFT_VERSION to be set to non-empty string. Exiting."
  exit 1
fi

# Download Minecraft client .jar (Contains textures used by Minecraft Overviewer)
wget -N https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VERSION}/${MINECRAFT_VERSION}.jar -P /home/minecraft/.minecraft/versions/${MINECRAFT_VERSION}/

echo "Removing old cronjob instance if it already exists"
crontab -l | grep -v "generate-map.sh" | crontab - 
echo "Creating new cronjob for autosave"
crontab -l | { cat; echo "* * * * * /home/minecraft/generate-map.sh >> /home/minecraft/generation.log 2>&1"; } | crontab -
echo "Cron job initialized"

# move into the rendered map folder
cd /home/minecraft/render

# start simple http server
python -m SimpleHTTPServer 80