FROM        python:3-alpine
MAINTAINER  Grégoire Weber

VOLUME      /home/minecraft/render
WORKDIR     /home/minecraft

COPY        entrypoint.sh .
COPY        index.html .

EXPOSE      80

ENTRYPOINT  ["sh", "./entrypoint.sh"]
