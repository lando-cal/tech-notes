Title: awk

"pattern-directed scanning and processing language" - `man awk`

# Examples

Some of these require GNU awk.

## Print the first column of a file

```
awk '${print $1}' filename.txt
```

## Print column 2 if column 1 matches a string

```
ps aux | awk '$1 == "root" {print $2}'
```

## Sort a file by line lengths

```
awk '{print length, $0}' testfile.txt | sort -n
```

## TDL to CSV

```
awk '{gsub("\t","\",\"",$0); print;}' | sed 's#^#"#;s#$#"#;'
```

## Print the first column of every other line

% is the modulus operator, which finds the remainder after an integer
divide.

```
awk 'NR % 2 == 0 { print $1 }'
```

## Print only even numbered lines

```
ls | awk 'NR % 2 == 0 { print $0 }'
```

## Print only odd numbered lines

```
ls | awk 'NR % 2 != 0 { print $0 }'
```

## Print even numbered lines on the same line before odd numbered lines

```
awk '{if (NR%2==0) { print $0 " " prev } else { prev=$0 }}'
```

## Print sum all the first columns of each line in a file

```
awk '{sum += $1} END {print sum}' filename
```

## Print sum and average of the first column of a file

```
awk '{sum += $1} END {avg = sum/NR ; printf "Sum:     %s\nAverage: %s\n", sum, avg}' foo.txt
```

## Split file by recurring string

This will create a new file every time the string "SERVER" is found, essentially splitting the file by that string. Concatenating all of the output files would create the original file (potentially adding an extra newline).

```
awk '/SERVER/{n++}{print >"out" sprintf("%02d", n) ".txt" }' example.txt
```

## Show count of syslog messages per minute

```
awk -F: {'print $1 `“`:`”` $2'} /var/log/messages |uniq -c
```

## Show count of root logins per minute

```
awk -F: '/root/{print $1 ":" $2}' /var/log/auth.log |uniq -c
```

## Print lines in ls where UID is numeric

```
ls -la | awk '$3 ~/[0-9]/{print}'
```

## Show only zfs snapshots whose size is zero

```
zfs list -t snapshot | awk '$2 == 0'
```

## Print a line if the third field does not match a regex

```
tcpdump -r ops1prod-syn.cap | sort -k2 | awk '$3 !~ /ztmis.prod/ { print }'
```

## Show 500 errors in a standard apache access log

```
awk '$9 ~ /5[0-9][0-9]/' www_zoosk_access.log
```

## Show total rss and vsz count for all cronolog processes

```
ps aux |
  grep -i cronolo[g] |
  awk '{vsz += $5; rss += $6} END {print "vsz total = "vsz ; print "rss total = "rss}'
```

## Get IPv4 address on BSD/OSX

```
ifconfig | awk '$1 == "inet" && $2 != "127.0.0.1" {print $2}'
```

## Get IPv6 address on BSD/OSX

```
ifconfig | awk '$1 == "inet6" && $2 !~ "::1|.*lo" {print $2}'
```

## Print the last element

```
ls -la | awk -F" " '{print $NF}'
```

## Print 2nd to last element

```
ls -la | awk -F" " '{print $(NF - 1)}'
```

## Print the previous line on string match

This works by storing the previous line. If the current line matches the regex, the previous line is printed from the stored value.

```
$ awk '/32 host/ { print previous_line } {previous_line=$0}' /proc/net/fib_trie | column -t | sort -u
|--  10.134.243.137
|--  127.0.0.1
|--  169.50.9.172
```

# See Also

- <http://www.grymoire.com/Unix/Awk.html>
