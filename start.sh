#!/bin/bash

service ssh start
sleep 2

# log للتأكد
echo "=== SSH status ==="
service ssh status
echo "=== Ports ==="
ss -tlnp

exec websockify 0.0.0.0:${PORT:-10000} 127.0.0.1:22
