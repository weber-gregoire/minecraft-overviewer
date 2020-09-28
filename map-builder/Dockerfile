FROM    debian:latest

RUN     apt-get update && \
        apt-get install -y wget gnupg cron build-essential python3-pil python3-dev python3-numpy python-dev && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
        mkdir -p /home/minecraft/render /home/minecraft/sharedRender /home/minecraft/server /home/minecraft/scripts /root/.minecraft/versions/1.16

WORKDIR /home/overviewer/
RUN     wget https://overviewer.org/textures/1.16 -O /root/.minecraft/versions/1.16/1.16.jar && \
        wget -O overviewer.tar.gz https://github.com/overviewer/Minecraft-Overviewer/tarball/master && \
        tar -xzvf overviewer.tar.gz && \
        cd $(ls | grep overviewer-Minecraft-Overviewer) && \
        python3 setup.py build && \
        python3 setup.py install

RUN     ln -sf /proc/1/fd/1 /home/minecraft/cron.log
COPY    config/config.py /home/minecraft/config.py
COPY    entrypoint.sh /home/minecraft/entrypoint.sh
COPY    scripts/* /home/minecraft/scripts/

WORKDIR /home/minecraft/

VOLUME  ["/home/minecraft/server", "/home/minecraft/sharedRender"]

CMD     ["bash", "/home/minecraft/entrypoint.sh"]
