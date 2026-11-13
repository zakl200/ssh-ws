#!/bin/bash

service ssh start
sleep 2

exec websocat \
    -E \
    -t \
    --ping-interval=20 \
    ws-l:0.0.0.0:${PORT:-10000} \
    tcp:127.0.0.1:22
