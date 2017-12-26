The `date` shell command

date behaves differently between gnu and bsd. In OS X you can install gnu date by doing `brew install coreutils`

## GNU date

### Show adjusted date/time

```
date -d -2month # two months ago
date -d +1hour # one hour in the future
date -d +15minute
date -d "last week + 1 hour"
date -d "january 10 1978 + 5 years" +%a
```

### Convert a string date to epoch seconds

```
date -d "Fri Sep  7  2:00 2012" +%s
```

### Convert epoch seconds to string date

```
date -d @1375899534
```

### Output various RFC 3339 time formats

```
date --rfc-3339=date
date --rfc-3339=seconds
date --rfc-3339=ns
```

### Show and number all previous weeks from one year ago

```
for X in {1..53} ; do printf "%02s " ${X} ; date -d -49weeks-2days+${X}week "+%b %d %Y" ; done ;
```

### Show and number all weeks from the point I started working at Zoosk

```
for X in {1..90} ; do printf "%02s " ${X} ; date -d "June 10 2013 - 1 week + ${X} week" "+%a %b %d %Y" ; done ;
```

### Show how many seconds old I am

```
echo "$(date +%s) - $(date -d "January 10 1978 7:46pm" +%s)" | bc
```

### Show subsecond date, without going full nano

```
for X in {1..100} ; do date +%s.%N | cut -c1-15 ; done ;
```

### Sleep until the next 5 minute 0 seconds mark

```
while sleep $(date "+60 - %S.%N" | bc) 240 ; do date "+%F %T.%N" ; done ;
```

## BSD date

### Show adjusted date/time

```
date -v-2m # two months ago
date -v+1H # one hour in the future
```

### Convert epoch seconds to string date

```
date -r 1514308711
```
