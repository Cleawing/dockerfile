#!/bin/sh

export MESOS_LOG_DIR="/var/log/mesos"
export MESOS_WORK_DIR="/var/lib/mesos"
export MESOS_REGISTRY="replicated_log"

mesos-master
