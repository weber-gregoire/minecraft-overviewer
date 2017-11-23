#!/bin/bash
ACTIVE_GENERATION_FLAG="/home/minecraft/generate";

if [ -f $ACTIVE_GENERATION_FLAG ]; then
  echo "Not updating POIs, map generation is running..."
else
  overviewer.py --config /home/minecraft/config.py --genpoi
  sed -i "s|\"checked\": false|\"checked\": true|g" /home/minecraft/render/markers.js

  grep "?key=" /home/minecraft/render/index.html
  if [ $? != 0 ]; then
    sed -i 's|https://maps.google.com/maps/api/js|&?key="${GOOGLE_MAPS_API_KEY}"|g' /home/minecraft/render/index.html
  fi
fi