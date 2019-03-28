FROM debian:latest

RUN     apt-get update && \
        apt-get install -y wget gnupg cron && \
        echo "deb http://overviewer.org/debian ./" >> /etc/apt/sources.list && \
        wget -O - https://overviewer.org/debian/overviewer.gpg.asc | apt-key add - && \
        apt-get update && \
        apt-get install -y minecraft-overviewer && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
        mkdir -p /home/minecraft/render /home/minecraft/sharedRender /home/minecraft/server /home/minecraft/scripts

RUN     ln -sf /proc/1/fd/1 /home/minecraft/cron.log
COPY    config/config.py /home/minecraft/config.py
COPY    entrypoint.sh /home/minecraft/entrypoint.sh
COPY    faithful-1.13.2-rv2.zip /home/minecraft/texture.zip
COPY    scripts/* /home/minecraft/scripts/

WORKDIR /home/minecraft/

VOLUME  ["/home/minecraft/server", "/home/minecraft/sharedRender"]

CMD     ["bash", "/home/minecraft/entrypoint.sh"]
