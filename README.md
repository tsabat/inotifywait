this project demonstrates that file system events are not propigating to the
containers in Docker for Mac

## requirements

* docker for mac
* version 1.12
* a strong stomach for disappointment

## example of file system events working

```bash
cd docker_run
./run.sh
```

## example of file system events *NOT* working

```bash
cd docker_swarm
./run.sh
```
