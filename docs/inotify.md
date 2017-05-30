- "inotify - monitoring file system events" - `man inotify`
- "inotifywatch - gather filesystem access statistics using inotify" - `man inotifywatch`
- "The inotify cron daemon (incrond) is a daemon which monitors filesystem events and executes commands defined in system and user tables. It's (sic) use is generally similar to cron(8)." - `man incrond`

# Examples

## Continuously show filesystem events on a file

This shows a datestamp when /var/log/syslog is modified. Theoretically we could use `%N` to get millisecond precision, but it doesn't work.

```
sudo sudo inotifywait -m --timefmt '%F %T.%z' --format '%T %w %e %f' /var/log/syslog
```
