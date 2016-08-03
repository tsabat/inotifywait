#!/bin/bash

docker service create \
  --name docker_swarm \
  --mount "type=bind,source=$(pwd)/watch,target=/opt/watch" \
  timsabat/inotifywait


for i in {1..5}; do echo "sleeping $i of 5"; sleep 1; done

for i in {1..10}; do echo $i > watch/$i.txt; done


docker ps --filter name=docker_swarm --format={{.Names}} | xargs docker logs
