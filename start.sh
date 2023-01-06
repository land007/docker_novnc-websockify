#!/bin/bash
nohup /analytics.sh > /dev/null 2>&1 &
/etc/init.d/ssh start
/check.sh /node
#supervisor -w /node/ -i node_modules /node/server.js
node websockify.js --web ./noVNC 9000 $VNC_SERVER
