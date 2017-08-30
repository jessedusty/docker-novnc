#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 $SCREEN_SIZE &
sleep 5

openbox-session&

/app-startup.sh &

x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
cd /root/noVNC && cp vnc.html index.html &&  ./utils/launch.sh --listen 80 --vnc localhost:5900

