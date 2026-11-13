#!/bin/bash
service ssh start
websocat -t --binary ws-l:0.0.0.0:8000 tcp:127.0.0.1:22
