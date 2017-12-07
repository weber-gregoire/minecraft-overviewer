#!/bin/bash

INDEX_FILE_PATH="/home/minecraft/render/index.html"
GOOGLE_MAP_SCRIPT="https://maps.google.com/maps/api/js"

grep "?key=" ${INDEX_FILE_PATH}
if [ $? != 0 ]; then
  sed -i "s|${GOOGLE_MAP_SCRIPT}|${GOOGLE_MAP_SCRIPT}?key=${GOOGLE_MAPS_API_KEY}|g" ${INDEX_FILE_PATH}
fi

grep "?key=\"" ${INDEX_FILE_PATH}
if [ $? == 0 ]; then
  sed -i "s|${GOOGLE_MAP_SCRIPT}?key=\"|${GOOGLE_MAP_SCRIPT}?key=${GOOGLE_MAPS_API_KEY}\"|g" ${INDEX_FILE_PATH}
fi