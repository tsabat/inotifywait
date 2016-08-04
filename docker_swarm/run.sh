#!/bin/bash

docker build -t inotifywait .

docker service create \
  --name docker_swarm \
  --mount "type=bind,source=$(pwd)/watch,target=/opt/watch,bind-propagation=shared,writable=true" \
  inotifywait

for i in {1..10}; do echo $i > watch/$i.txt; done

sleep 5

docker ps --filter name=docker_swarm --format={{.Names}} | xargs docker logs
rm watch/*txt
#docker service rm docker_swarm

