#!/bin/bash
ACTIVE_GENERATION_FLAG="/home/minecraft/generate";

if [ -f $ACTIVE_GENERATION_FLAG ]; then
  echo "Not updating POIs, map generation is running..."
else
  overviewer.py --config /home/minecraft/config.py --genpoi
  sed -i "s|\"checked\": false|\"checked\": true|g" /home/minecraft/render/markers.js

  /home/minecraft/scripts/update-google-map-key.sh
fi