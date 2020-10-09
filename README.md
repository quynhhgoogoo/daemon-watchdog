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

- In 5 minute intervals
- Rotate the `/tmp/daemon.log` file if file size exceeds 1000 bytes
- Retain one copy of rotated logs

## Report
- Time spent: Research (2.5 hours), Daemon implementation (2.5 hours), Watchdog Implementation (4 hours)
- Reference
<br> [1]: https://www.linux.com/training-tutorials/managing-linux-daemons-init-scripts/
<br> [2]: https://linoxide.com/linux-how-to/setup-log-rotation-logrotate-ubuntu/
<br> [3]: http://www.freekb.net/Article?id=418
<br> [4]: https://www.unix.com/shell-programming-and-scripting/135407-check-file-size-log-rotation.html
