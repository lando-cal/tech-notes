"Redis is an open source (BSD licensed), in-memory data structure store, used as a database, cache and message broker." - <https://redis.io>


# Tips and Examples

## Solve memory allocation problems

Errors like this can cause the disk to fill up over long periods of time:

```
[2535] 02 Jan 19:58:52.376 * Starting automatic rewriting of AOF on 7885% growth
[2535] 02 Jan 19:58:52.376 # Can't rewrite append only file in background: fork: Cannot allocate memory
```
This problem can bbe solved without restarting anything:

```
# df -h .
Filesystem      Size  Used Avail Use% Mounted on
/dev/xvdf       250G  135G  116G  54% /srv
# cat /proc/sys/vm/overcommit_memory
0
# echo 1 > /proc/sys/vm/overcommit_memory
# tail  redis.log
[2535] 02 Jan 22:03:23.707 * Starting automatic rewriting of AOF on 7885% growth
[2535] 02 Jan 22:03:23.707 # Can't rewrite append only file in background: fork: Cannot allocate memory
[2535] 02 Jan 22:03:23.807 * Starting automatic rewriting of AOF on 7885% growth
[2535] 02 Jan 22:03:23.807 # Can't rewrite append only file in background: fork: Cannot allocate memory
[2535] 02 Jan 22:03:23.907 * Starting automatic rewriting of AOF on 7885% growth
[2535] 02 Jan 22:03:23.926 * Background append only file rewriting started by pid 27302
[27302] 02 Jan 22:04:05.337 * SYNC append only file rewrite performed
[27302] 02 Jan 22:04:05.379 * AOF rewrite: 36 MB of memory used by copy-on-write
[2535] 02 Jan 22:04:05.406 * Background AOF rewrite terminated with success
[2535] 02 Jan 22:04:05.406 * Parent diff successfully flushed to the rewritten AOF (42 bytes)
[2535] 02 Jan 22:04:05.406 * Background AOF rewrite finished successfully
# df -h .
Filesystem      Size  Used Avail Use% Mounted on
/dev/xvdf       250G  4.5G  246G   2% /srv
```

## Find what is using the most memory

```
redis-cli --bigkeys
```

# Links

- <https://redis.io/topics/faq>
- <https://redis.io/commands>
