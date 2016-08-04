#!/bin/bash

set -e

docker build -t inotifywait .
docker run -d --name=docker_run -v $(pwd)/watch:/opt/watch inotifywait

for i in {1..10}; do echo $i > watch/$i.txt; done

sleep 5

#if you want to hack around, use this log command instead and remove the rm command at the end
#docker logs -f docker_run
docker logs docker_run
rm watch/*txt
docker rm -f docker_run
