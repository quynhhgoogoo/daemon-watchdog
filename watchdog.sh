#!/bin/bash

#Initialize log's path and time interval
watchdog_log='/tmp/watchdog.log'
t1=10
t2=300      #5 minutes

#Startup
printf "Watchdog started\n" >> $watchdog_log

