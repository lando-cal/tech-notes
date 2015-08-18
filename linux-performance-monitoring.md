Notes from the Linux Performance Monitoring talk at Velocity 2015 - [Part 1](http://www.youtube.com/watch?v=FJW8nGV4jxY), [Part 2](http://www.youtube.com/watch?v=zrr2nUln9Kk)

# USE
- Utilization
- Saturation
- Errors

# Tools
- atop / htop
- vmstat -Sm 1
- iostat -xmdz 1
- mpstat -P ALL 1
- free -m
- sar -n DEV 1
- strace -tttT # very disruptive of system performance, slows system significantly
- tcpdump
- pidstat -t 1
- pidstat -d
- swapon -s
- lsof
- sar -n TCP,ETCP,DEV 1
- collectl
- dstat
- strace 2>&1 | head -n 100 # since there's no strace -c N
