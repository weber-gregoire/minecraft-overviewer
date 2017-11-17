#!/bin/bash
while true
do
  overviewer.py --config /home/minecraft/config.py --genpoi
  sed -i "s|\"checked\": false|\"checked\": true|g" /home/minecraft/render/markers.js

  grep "?key=" /home/minecraft/render/index.html
  if [ $? != 0 ]; then
    sed -i "s|https://maps.google.com/maps/api/js|&?key=${GOOGLE_MAPS_API_KEY}|g" /home/minecraft/render/index.html
  fi
  
  sleep 2
done