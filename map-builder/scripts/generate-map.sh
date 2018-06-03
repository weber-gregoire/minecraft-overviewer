#!/bin/bash
ACTIVE_GENERATION_FLAG="/home/minecraft/generate";

if [ -f $ACTIVE_GENERATION_FLAG ]; then
  echo "Map generation is already running..."
else
  echo "generating..." >> $ACTIVE_GENERATION_FLAG

  # Run the world renders (One pass to make map, one to generate points of interests)
  overviewer.py --config /home/minecraft/config.py

  rm /home/minecraft/temp/index.html
  cp -Rp /home/minecraft/temp/* /home/minecraft/render/.

  rm -rf $ACTIVE_GENERATION_FLAG
fi