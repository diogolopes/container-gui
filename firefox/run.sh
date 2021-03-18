#!/bin/bash
podman run -d --rm -v /tmp/.X11-unix:/tmp/.X11-unix --security-opt=label=type:container_runtime_t -e DISPLAY localhost/gui/firefox
