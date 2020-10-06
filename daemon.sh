#!/bin/bash

time_interval=30

#Create a loop
while true

do
	
	#Get current date and time
	date_and_time="$(date +'%d-%m-%Y %H:%M:%S')"
	printf "%s Mock daemon is still running\n" "$date_and_time"
	sleep $time_interval

done
