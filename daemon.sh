#!/bin/bash

#Initialize script file and PID for daemon
script_file='./record_daemon.sh'
pid_file=${script_file}.pid

#Start daemon
startDaemon(){
    echo -n "Starting the process"

    if [ -f $pid_file ]; then
        #Get pid from pid file
        pid_content= `cat $pid_file`
        echo "Already running" "$pid_content"
        exit 2;
    else
        #Run script in the background and assign the PID of the newly started program to pid_content
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

#Check daemon status
statusDaemon(){
    echo -n "Checking daemon status"

    pid_content=`cat $pid_file`
    echo "$pid_content"
    ps -p $pid_content

    return 0
}

#Restart deamon
restartDaemon(){
    echo -n "Restarting Daemon"

    stopDaemon
    startDaemon
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
    status)
        statusDaemon
        ;;
    restart)
        restartDaemon
        ;;
    *)
        echo "Usage:  {start|stop|status|restart}"
        exit 1
        ;;
esac