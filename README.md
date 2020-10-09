# Daemon and Watchdog

## Software Configuration
<b>1. Setup program </b>
- The Linux version used for development is `Ubuntu 18.04.3 LTS`
- Switch too root user `sudo su -`
- Enter the corresponding credentials
- Clone the respository `git clone https://github.com/quynhhgoogoo/daemon-watchdog.git`
<br>

<b>2. Run the daemon features </b> 
- The syntax used to run the daemon bash is `./daemon.sh start {start|stop|status|restart}`
- Start the daemon `./daemon.sh start`
- Stop the daemon `./daemon.sh stop`

<b>3. Run the watchdog features </b> 
- The syntax used to run the watchdog bash is `./watchdog.sh `

## Walkthrough
- Run daemon bashscript
<br>
Note: The script is running in the background. I print it on screen so that it is easier to track
<br>

![image](https://user-images.githubusercontent.com/26543302/95573686-82903c80-0a34-11eb-89e6-6c42b65f762f.png)
![image](https://user-images.githubusercontent.com/26543302/95574093-16fa9f00-0a35-11eb-9fcc-a85e207e655b.png)

- Run watchdog script
<br>

![image](https://user-images.githubusercontent.com/26543302/95575244-04816500-0a37-11eb-9d7c-1f38d82f8b80.png)
![image](https://user-images.githubusercontent.com/26543302/95575323-28dd4180-0a37-11eb-81b6-39da5cadc0f9.png)

## Problem Set

Implement a watchdog and a mock daemon as shell scripts

#### Mock daemon features
Mock daemon simulates a running software component. On startup, the mock daemon enters a loop where it writes the following line to `/tmp/daemon.log`:

YYYY-MM-DD hh:mm:ss Mock daemon is still running
- The line should be written to the line in 30 second intervals.
- Mock daemon should run in background after startup
 
#### Watchdog features
On startup, create a log file with message: "Watchdog started" to `/tmp/watchdog.log`
1. In 10 second intervals
- Check if the mock daemon process is running on the system
- If the mock daemon is not running, watchdog should restart it
- If daemon was restarted, write message: "Daemon restarted" to `/tmp/watchdog.log`

2. In 5 minute intervals
- Rotate the `/tmp/daemon.log` file if file size exceeds 1000 bytes
- Retain one copy of rotated logs

## Report
- Time spent: Research (2.5 hours), Daemon implementation (2.5 hours), Watchdog Implementation (4 hours)
- Reference
<br> [1]: https://www.linux.com/training-tutorials/managing-linux-daemons-init-scripts/
<br> [2]: https://linoxide.com/linux-how-to/setup-log-rotation-logrotate-ubuntu/
<br> [3]: http://www.freekb.net/Article?id=418
<br> [4]: https://www.unix.com/shell-programming-and-scripting/135407-check-file-size-log-rotation.html
