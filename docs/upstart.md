# Redirect all output of an upstart script to syslog

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
