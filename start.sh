#!/bin/bash
mkdir -p /var/run/sshd
/usr/sbin/sshd
sleep 2
exec websockify 0.0.0.0:${PORT:-10000} 127.0.0.1:22
