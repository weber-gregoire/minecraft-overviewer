#!/bin/bash
ACTIVE_GENERATION_FLAG="/home/minecraft/generate";

if [ -f $ACTIVE_GENERATION_FLAG ]; then
  echo "Not updating POIs, map generation is running..."
else
  overviewer.py --config /home/minecraft/config.py --genpoi
  cp -Rp /home/minecraft/render/* /home/minecraft/sharedRender/.
fi