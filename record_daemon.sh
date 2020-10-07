#!/bin/bash

#Initialize time interval and log file's path
time_interval=30
daemon_log='/tmp/daemon.log'

#Create a loop
while true

do
	#Get current date and time
	date_and_time="$(date +'%d-%m-%Y %H:%M:%S')"
	
	#Record inside log file
	printf "%s Mock daemon is still running\n" "$date_and_time"
	printf "%s Mock daemon is still running\n" "$date_and_time" >> $daemon_log
	
	sleep $time_interval
done
