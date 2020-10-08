daemon_log='/tmp/daemon.log'
max_size=10

$daemon_log {
    rotate 1
    size $max_size
    dateformat %Y-%m-%d.
}