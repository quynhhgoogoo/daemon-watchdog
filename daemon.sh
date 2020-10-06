#!/bin/bash

#Initialize script file and PID for daemon
script_file='./record_daemon.sh'
pid_file=${script_file}.pid

#Start daemon
startDaemon(){
    echo -n "Start running process as a daemon\n"
    if [ -f $pid_file ]; then
        pid_content = `cat $pid_file`
        echo "%s already running" "$pid_content"
        exit 2;
    else
        $script_file & pid_content=$!
        echo "Run sucessfully at %s" "$pid_content"
        return 0
    fi
}

#Switching option with daemon
input="$1"

case "$input" in
    start)
        startDaemon
        ;;
    *)
        echo "Usage:  {start|stop|status|restart}"
        exit 1
        ;;
esac