#!/bin/sh

export MESOS_IP=$(ip -4 addr show dev ethwe | grep -o 'inet [0-9.]*' | cut -d ' ' -f 2)
export MESOS_LOG_DIR="/var/log/mesos"

mesos-slave