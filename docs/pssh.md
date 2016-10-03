Parallel [SSH](SSH "wikilink") tools for running commands on multiple system simultaneously.

- <http://www.theether.org/pssh/>

# Examples

## Run a command on hosts contained in a file, showing stdin and stdout

```
pssh -h hostnames.txt -i some_command some_arg
```

## Run commands and view results on many hosts

```
o=$(date +%F-%T)
pssh -o "$o" -h hosts.txt uname -a
grep -r . $o
```

## Run two commands on many hosts using bash expansion for host list

```
o=$(date +pssh-%T)
pssh -p 50 -t 60 {-H\ sea-z-app00{1..9},} -o $o 'whoami ; hostname ;'
grep -r . $o
```

## Install a package on many hosts

```
pssh -h \
  <(awk '$3 == "alive" {print $1}' fping.txt | \
  egrep '[0-9]+1[^0-9]') \
-o out_dir \
-l root \
yum -y localinstall ~danielh/rpms/cfengine-community-3.6.2-1.x86_64.rpm
```

or directly from a db query and fping...

```
pssh -h \
  <(invdb -d sjc-z-01opsdbw 'select hostname from servers where colo = "sjc";' | \
  sort -u | \
  egrep '[0-9]+6[^0-9]' | \
  fping 2> /dev/null | \
  awk '$3 == "alive" {print $1}') \
-o out_dir \
-l root \
yum -y localinstall ~danielh/rpms/cfengine-community-3.6.2-1.x86_64.rpm
```

or from mco...

```
o=$(date +pssh-%T) ; pssh -h <(mco find) -o $o apt-get install -y silversearcher-ag
```
