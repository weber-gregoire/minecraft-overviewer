FROM        python:3-alpine
MAINTAINER  Grégoire Weber

VOLUME      /home/minecraft/render
WORKDIR     /home/minecraft/render

EXPOSE      80

ENTRYPOINT  ["python", "-m", "http.server", "80"]
