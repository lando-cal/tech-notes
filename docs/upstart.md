"Upstart is an event-based replacement for the `/sbin/init` daemon which handles starting of tasks and services during boot, stopping them during shutdown and supervising them while the system is running." - <http://upstart.ubuntu.com>

# Examples

## Start multiple instances of the same services

<http://upstart.ubuntu.com/cookbook/#instance>

### Master
```
start on runlevel [2345]
stop on runlevel [^2345]
respawn

env job_count=6

pre-start script
  for i in $(seq -w 1 ${job_count}) ; do
    start photoworker N=${i}
  done
end script

post-stop script
  for i in $(seq -w 1 ${job_count}) ; do
    stop photoworker N=${i}
  done
end script

```

### Child
```
respawn
respawn limit 10 5
instance $N
env logfile="/var/log/worker_photoworker.log"
chdir /srv/photoworkers/current/web/services/jobworkers

pre-start exec bash -c "echo $(date --rfc-3339=seconds) beginning worker run >> ${logfile}"
exec su -s /bin/sh -c 'exec "$0" "$@"' php-worker -- php photoworker.php >> ${logfile} 2>&1
post-stop exec bash -c "echo $(date --rfc-3339=seconds) ended worker run >> ${logfile}"
```

## Redirect all output of an upstart script to syslog

Found at <http://serverfault.com/questions/114052/logging-a-daemons-output-with-upstart>

```
script
  FIFO=fifo.temp
  mkfifo $FIFO

  ( logger -t myservice <$FIFO & )

  exec > $FIFO
  rm $FIFO

  exec /usr/local/bin/myservice 2>&1
end script
```

# Links

- <http://upstart.ubuntu.com/cookbook>
