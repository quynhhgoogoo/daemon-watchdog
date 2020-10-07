#!/bin/bash

#Initialize script file and PID for daemon

script_file='./record_daemon.sh'
pid_file=${script_file}.pid

#Start daemon
startDaemon(){
    echo -n "Starting the process"

    if [ -f $pid_file ]; then
        pid_content= `cat $pid_file`
        echo "%s already running" "$pid_content"
        exit 2;
    else
        $script_file & pid_content=$!
        echo $pid_content > $pid_file
        echo "Run sucessfully at" "$pid_content"
        return 0
    fi
}

#Stop daemon
stopDaemon(){
    echo -n "Shutting down the process"
        
    pid_content=`cat $pid_file`
    kill $pid_content
    rm -f $pid_file
    echo "Process has been stopped"
    return 0
}

#Switching option with daemon
input="$1"

case "$input" in
    start)
        startDaemon
        ;;
    stop)
        stopDaemon
        ;;
    *)
        echo "Usage:  {start|stop|status|restart}"
        exit 1
        ;;
esac