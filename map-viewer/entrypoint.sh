#!/bin/bash

set -ex

INDEX_FILE_PATH="/home/minecraft/index.html"
GOOGLE_MAP_SCRIPT="https://maps.google.com/maps/api/js?key="

sed -i "s|${GOOGLE_MAP_SCRIPT}|${GOOGLE_MAP_SCRIPT}${GOOGLE_MAPS_API_KEY}|g" ${INDEX_FILE_PATH}

mv index.html render/index.html

cd render

python -m http.server 80
