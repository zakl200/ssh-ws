#!/bin/bash

# تشغيل SSH
service ssh start

# انتظر SSH يكون جاهز
sleep 2

# تشغيل WebSocket proxy
# -E = exit on EOF (مهم لمنع socket leak)
# --ping-interval = يبقي الاتصال حياً
exec websocat \
    -E \
    -t \
    --ping-interval=20 \
    ws-l:0.0.0.0:8000 \
    tcp:127.0.0.1:22
