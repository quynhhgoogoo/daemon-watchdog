# daemon-watchdog

Implement a watchdog and a mock daemon as shell scripts

=======================================================

Mock daemon features

--------------------

 

Mock daemon simulates a running software component.

On startup, the mock daemon enters a loop where it writes the following line to `/tmp/daemon.log`:

YYYY-MM-DD hh:mm:ss Mock daemon is still running

The line should be written to the line in 30 second intervals.

Mock daemon should run in background after startup

 

Watchdog features

-----------------

On startup, create a log file with message: "Watchdog started" to `/tmp/watchdog.log`

1. In 10 second intervals

a. Check if the mock daemon process is running on the system

b. If the mock daemon is not running, watchdog should restart it

c. If daemon was restarted, write message: "Daemon restarted" to `/tmp/watchdog.log`


2. In 5 minute intervals

a. Rotate the `/tmp/daemon.log` file if file size exceeds 1000 bytes

b. Retain one copy of rotated logs


Implementation requirements

- scripts must work in ash (Almquist) compatible shell

- scripts can use standard Linux tools if needed

- code should be production quality and clean
 

Optional

- implement unit tests

- describe a test plan
 

Deliverables:

- Shell scripts

- git repository

- Report how much time was spent

- References used
