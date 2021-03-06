#!/bin/bash

docker build -t inotifywait .

docker service create \
  --name docker_swarm \
  --mount type=bind,source=$(pwd)/watch,target=/opt/watch,bind-propagation="" \
  inotifywait

for i in {1..10}; do echo $i > watch/$i.txt; done
for i in {1..10}; do echo "sleeping $i of 10"; sleep 1; done

docker ps --filter name=docker_swarm --format={{.Names}} | xargs docker logs
#docker ps --filter name=docker_swarm --format={{.Names}} | xargs docker logs -f

rm watch/*txt
docker service rm docker_swarm

