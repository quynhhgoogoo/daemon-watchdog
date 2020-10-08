#!/bin/bash

#Initialize log's path and time interval
script_file='./record_daemon.sh'
daemon="./daemon.sh"
pid_file=${script_file}.pid

watchdog_log='/tmp/watchdog.log'
t1=10
t2=300      #5 minutes

#Get log size
daemon_log='/tmp/daemon.log'
log_size=$(ls -l $daemon_log | awk '{print $5}')
max_size=1000
echo "$daemon_log"

#Startup
printf "Watchdog started\n" >> $watchdog_log


while true
do
    #First time interval: check if mock daemon is still running on system
    if [ -f $pid_file ]; then
        pid_content= `cat $pid_file`
        echo -n "Daemon is running already" "$pid_content"
        message="Daemon started"
        echo $message > $watchdog_log
        exit 1
    else
        echo -n "Daemon is not running. Restart the daemon"
        $daemon start
        exit 0
    fi
    sleep $t1
done &


#Second time interval: Rotate log if file exceeds 1000 bytes
while true
do
    if [ $log_size -ge $max_size ]; then
        echo -n "Log file exceeds" "$max_size"
        rm $daemon_log
    else
        echo "$daemon_log" "fits the maximum size of file with" "$log_size"
    fi
    sleep $t2
done