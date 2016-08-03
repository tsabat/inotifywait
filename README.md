this project demonstrates that file system events are not propigating to the
containers in Docker for Mac.

## requirements

* docker for mac
* version 1.12
* a strong stomach for disappointment

## example of file system events working

The following snippet runs a container with the `docker run` command, binding
the local `watch` directory to `/opt/watch` in the container then starting
`inotifywait` on it.

```bash
cd docker_run
./run.sh
```

## example of file system events *NOT* working

This snippet runs a the same image  with the `docker service create` command,
but uses the `--bind` flags instead of `--volume`.

```bash
cd docker_swarm
./run.sh
```
