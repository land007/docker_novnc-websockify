FROM land007/node:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN . $HOME/.nvm/nvm.sh && cd / && npm install ws optimist mime-types

#RUN wget https://github.com/novnc/noVNC/archive/master.zip
RUN cd /node_/ && git clone https://github.com/novnc/noVNC.git
#RUN cd /node_/ && wget https://raw.githubusercontent.com/novnc/websockify-js/master/websockify/websockify.js
ADD websockify.js /node_/

#RUN unzip master.zip

ENV VNC_SERVER "192.168.0.203:5901"

#RUN echo "nohup node websockify.js --web ./noVNC 9000 $VNC_SERVER > /tmp/websockify.out 2>&1 &" > /task.sh
ADD start.sh /
EXPOSE 9000/tcp

#docker buildx build --platform linux/amd64,linux/arm64/v8,linux/arm/v7 -t land007/novnc-websockify:latest --push .
#docker build -t land007/novnc-websockify:latest .
#docker rm -f novnc-websockify; docker run -it --name novnc-websockify -p 9000:9000 -e VNC_SERVER=192.168.0.203:5901 land007/novnc-websockify:latest
