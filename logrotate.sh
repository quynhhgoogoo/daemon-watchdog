'/tmp/daemon.log' {
  su root syslog
  size 1000
  rotate 1
  create
  include /tmp/daemon-copy.log
}
