#!/bin/bash

docker run --rm --name=docker_run -v $(pwd)/watch:/opt/watch timsabat/inotifywait &
for i in {1..10}; do echo $i > watch/$i.txt; done
