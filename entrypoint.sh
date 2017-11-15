#!/bin/bash
set -o errexit

# Run the world renders (One pass to make map, one to generate points of interests)
overviewer.py --config /home/minecraft/config.py
overviewer.py --config /home/minecraft/config.py --genpoi

# Add Google Maps API key if the GOOGLE_MAPS_API_KEY environment variable is set
if [ "$GOOGLE_MAPS_API_KEY" ]; then
  sed -i "s|https://maps.google.com/maps/api/js|&?key=${GOOGLE_MAPS_API_KEY}|g" /home/minecraft/render/index.html
fi
