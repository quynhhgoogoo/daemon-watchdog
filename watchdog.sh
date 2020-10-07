#!/bin/bash

#Initialize log's path and time interval
script_file='./record_daemon.sh'
daemon="./daemon.sh"

pid_file=${script_file}.pid

watchdog_log='/tmp/watchdog.log'
t1=10
t2=300      #5 minutes

#Startup
printf "Watchdog started\n" >> $watchdog_log

#First time interval: check if mock daemon is still running on system
while true
do
    #If daemon process is running
    if [ -f $pid_file ]; then
        pid_content= `cat $pid_file`
        echo -n "Daemon is running at" "$pid_content"
        message="Daemon started"
        echo $message > $watchdog_log
        exit 1
    else
        pid_content= `cat $pid_file`
        echo -n "Daemon is not running. Restart the daemon"
        $daemon start
        echo -n "Daemon is running with pid: " "$pid_content"
        exit 0
    fi
    sleep $t1
done