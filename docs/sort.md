Title: sort

sort is a command to sort lines of data.

# GNU Syntax Examples

In OS X, this is `gsort`.

## Randomly sort a file

Beware that this will put duplicate lines right next to each other. If you need better file shuffling use `shuf`.

```
sort -R foo
```

## Sort by two fields, first dictionary, second reverse numeric

```
# -k defines the sort key as starting position, sort style, ending position
# -r is included in the second key to reverse numeric sort

gsort -k1d,1 -k2nr,2
```

## Sort IP Addresses by first octet then last octet, showing which fields are sorted

```
ip neigh show | sort -k1,1n -k4,4n -t. --debug
```

Console example:
```
$ ip neigh show | sort -k1,1n -k4,4n -t. --debug
sort: using ‘en_US.UTF-8’ sorting rules
10.0.2.2 dev eth0 lladdr 52:54:00:12:35:02 REACHABLE
__
       _
____________________________________________________
10.0.2.3 dev eth0 lladdr 52:54:00:12:35:03 STALE
__
       _
________________________________________________
192.16.35.10 dev eth1 lladdr 08:00:27:7a:50:42 STALE
___
          __
____________________________________________________
192.16.35.11 dev eth1 lladdr 08:00:27:56:64:2f STALE
___
          __
____________________________________________________
```


# BSD Syntax Examples

GNU sort and BSD sort behave differently, which is mostly lame.

## Sort by the third column

```
sort -k 3 filename
```

## Sort dates by the day

This example shows how to sort dates in ISO Year format by date. (EG: 2017-01-19). Assumes use of `bash` 4 to generate the example dates.

```
# -n for numeric sort
# -k3 for column 3
# -t- to use - as a column delimiter

for X in {2016..2017}-{01..12..03}-{01..19..06} ; do echo ${X} ; done |

sort -n -k3 -t-
```

## Sort the /etc/passwd by UID

Also works on /etc/group file and GID

```
sort -n -t: -k 3 /etc/passwd
```

## Scan for airport and sort by columns

Print out two rows signifying column numbers, which makes it easier to find which columns you want to sort by, then run a command and sort by column numbers. This assumes you're on macOS.

```
perl -e '
foreach ( 1 .. 9 ) {
    foreach ( 1 .. 9 ) { print " "; }
    print $_;
}
print "\n";
foreach ( 1 .. 9 ) {
    foreach ( 1 .. 9, 0 ) { print $_; }
}
print "\n";' ; \
airport --scan | sort -k 1.52,1.54
```
