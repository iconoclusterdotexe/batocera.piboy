#!/bin/bash
PID=$(pgrep -f  piboy_fan_ctrl.py)
kill $PID
echo 50 >/sys/kernel/xpi_gamecon/fan
