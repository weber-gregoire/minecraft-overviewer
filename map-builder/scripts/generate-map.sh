#!/bin/bash
ACTIVE_GENERATION_FLAG="/home/minecraft/generate";

if [ -f $ACTIVE_GENERATION_FLAG ]; then
  echo "Map generation is already running..."
else
  touch $ACTIVE_GENERATION_FLAG

  # Run the world renders (One pass to make map, one to generate points of interests)
  /usr/local/bin/overviewer.py --config /home/minecraft/config.py

  cp -Rp /home/minecraft/render/* /home/minecraft/sharedRender/.

  rm -rf $ACTIVE_GENERATION_FLAG
fi