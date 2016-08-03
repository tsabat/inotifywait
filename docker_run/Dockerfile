FROM node:5-slim

RUN apt-get update && apt-get install -y inotify-tools
RUN mkdir -p /opt/watch

CMD inotifywait -m -r -e modify,attrib,close_write,move,create,delete /opt/watch/
