This doc has been automatically converted and still needs some cleanup.

Bash is the most common mainstream *nix shell.

# Tricks and Usage

## Navigating on the command line

The following can be seen by running: `stty -a`

- ctrl-a - move cursor to the beginning of the line
- ctrl-e - move cursor to the end of the line
- ctrl-l - do a "clear" on the terminal window
- ctrl-r - reverse history command search
- ctrl-t - get status of foreground process
- ctrl-w - delete previous word

## View a list of all commands, etc..

- `compgen -b` will list all the built-ins you could run.
- `compgen -a` will list all the aliases you could run.
- `compgen -c` will list all the commands you could run.
- `compgen -k` will list all the keywords you could run.
- `compgen -A` function will list all the functions you could run.
- `compgen -back` will list all the above in one go.

## Remove leading zeroes

```
for X in 00{1..20..2} ; do
  echo "$X == $((10#${X}))" ;
done ;
```

Or...

```
for X in {1..50..5} ; do
  Y=00${X} ;
  echo "${X} with zeroes is ${Y} and removed with bc is $(echo ${Y} | bc)" ;
done ;
```

## Convert base 36 to decimal

This converts the base 36 number z to a decimal value

`echo $((36#z))`

## Run a command for 5 seconds, then kill it

`ping -f & sleep 5 ; kill %1`

Alternatively, use the timeout command if it's available. In macOS this can be installed through `homebrew install coreutils` and accessed with `gtimeout`.

`timeout 300 cmd`

## Test if a variable is empty

`if [[ -z "$var" ]]`

## Date

For date stuff, see date, because it's different depending on platform.

## Show RANDOM statistics

```
for X in {0..9999} ; do
  echo $(($RANDOM % 5)) ;
done |
sort |
uniq -c
```
## named pipes

`mkfifo baz ; ps aux > baz` then in another terminal `cat baz`

## alternate redirection outputs

`exec 3> /tmp/baz ; ps aux >&3 # sends the output of ps aux to /tmp/baz`

## Redirect all output of a script into a file

This is not bash specific, but works in bash.

```
#!/usr/bin/env bash

exec >> /tmp/$0.log
exec 2>&1

date "+%F %T%z $0 This is stdout"
date "+%F %T%z $0 This is stderr" >&2
```

## Show size of each user's home folder

```
getent passwd |
while IFS=: read -r user _ uid _ _ home _ ; do
  if [[ $uid -ge 500 ]] ; then
    printf "$user " ;
    sudo du -sh $home ;
  fi ;
done
```

## Previous command's args

`mkdir temp ; cd !!:*`

Be aware of the location of the tokens. eg: `mkdir -p {foo,bar}/{a,b,c} ; stat !!:*` creates a problem because you can't `stat -p` so you must `stat -p !!:2*`

## Debug a script

This will show everything bash is executing

`bash -x scriptname.sh`

Or debug with a function:

`function debug { if [ ${debug:-0} -gt 0 ] ; then echo $@ 2>&1 ; fi ; }`

## Find where all the inodes are

```
find ~/ -type d -print0 |
xargs -I %% -0 bash -c "echo -n %% ; ls -a '%%' | wc -l" >> ~/inodes.txt
```

## Build and print an array

```
array=("one is the first element");
array+=("two is the second element" "three is the third");
echo "${array[@]}"
```

This is useful for building command line strings. For example, `gpsbabel` requires each input file to be prepended with `-f`. The following script takes a list of files and uses a bash array to create a command line in the form of `gpsbabel -i gpx -f input_file_1.gpx -f input_file_2.gpx -o gpx -F output.gpx`

```
#!/usr/bin/env bash

# Check for at least one argument, print usage if fail
if [ $# -lt 2 ] ; then
    echo "This script merges gpx files and requires at least two gpx files passed as arguments. Output is output.gpx";
    echo "Usage:    $0 <gpx file> <gpx file> [...<gpx file>]";
    exit 1;
fi

# Create an array of arguments to pass to gpsbabel
args=();
for f in "$@" ; do
    if [ -f "$f" ] || [ -h "$f" ] ; then
        args+=( "-f" "$f" );
    else
        echo "Skipping $f, it's not a file or symlink."
    fi
done;

### Verify we have at least two files to work with
if [ "${#args[@]}" -lt 4 ] ; then
    echo "We don't have enough actual files to work with. Exiting."
    exit 1
fi

gpsbabel -i gpx "${args[@]}" -o gpx -F output.gpx
```

## Build and print an associative array (dict, hash)

```
declare -A animals=(
  ["cow"]="moo"
  ["dog"]="woof woof"
  ["cat"]="meow"
) ;
for animal in "${!animals[@]}" ; do
  echo "The $animal says '${animals[$animal]}'" ;
done ;
```

## Show permissions in rwx and octal format

- Linux: `stat -c '%A %a %n' filename`
- OSX: `stat -f '%A %N' filename`

## Find the length of a variable

`echo ${#SHELL}`

## Print all variables that start with the substring `SH`

```
echo ${!SH*}
```

## Tertiary type variables

`${V:-D} # means "return the value of the environment variable V or the string D if V isn't set.`

## Do a command, and if it returns false, so some more stuff

`while ! command_that_will_fail ; do something_else ; done ;`

## Print two digit months

`echo {1..12}` may not work. If not, use `echo $(seq -w 1 12)`

## Get filename, extension or path

Taken from <http://mywiki.wooledge.org/BashFAQ/073>

## Rename files to a sequence and change their extension at the same time

```
ls | while read -r line ; do
  stub=${line%.*} ;
  (( i += 1 )) ;
  mv "${line}" "${i}-${stub}.txt3" ;
done ;
```

```
FullPath=/path/to/name4afile-00809.ext   # result:   #   /path/to/name4afile-00809.ext
Filename=${FullPath##*/}                             #   name4afile-00809.ext
PathPref=${FullPath%"$Filename"}                     #   /path/to/
FileStub=${Filename%.*}                              #   name4afile-00809
FileExt=${Filename#"$FileStub"}                      #   .ext
```

## Sort a line by spaces

```
s=( whiskey tango foxtrot );
sorted=$(printf "%s\n"` `${s[@]}|sort);
echo $sorted
```

## Calculate the difference between two dates

```
echo $(( $(gdate +%s -d 20120203) - $(gdate +%s -d 20120115) ))
```

## substring replace a variable

This is not regex, just a simple string replacement.

```
# ${VAR/search/replace} does only the first
# ${VAR//search/replace} does all replacements
echo "Paths in your path: ${PATH//:/ }"
```

## Subtract two from a MAC address

```
# printf -v defines a variable instead of printing to stdout
printf -v dec "%d" 0x$(echo 00:25:9c:52:1c:2a | sed 's/://g') ;
let dec=${dec}-2 ;
printf "%012X" ${dec} \
| sed -E 's/(..)(..)(..)(..)(..)(..)/\1:\2:\3:\4:\5:\6/g'
```

## Print the last for chars of a variable

- `echo ${foo:$((${#foo}-4))}`
- `echo ${foo: -4}` The space is necessary to prevent it from
- doing a completely different thing. See the next example...

## Print something else if a variable doesn't exist

- `echo ${foo:-foo isn't assigned}`
- `echo ${foo:-${bar}}`

This can even be recursively done...

- `echo ${foo:-${bar:-foo and bar are not assigned}}`

## Print every third number starting with 1 and ending with 30

`echo {1..30..3}`

## Print every 5th letter of the alphabet

`echo {a..z..5}`

## Make a directory structure of every combination of /adjective/noun

`mkdir -p {red,green,blue}/{fish,bird,flower}`

## Generate a zero padded random 2 byte hex number

`printf "%02X\n" $((RANDOM % 256))`

## grep many log files and sort output by date

```
sudo grep cron /var/log/* \
| sed 's/:/ /' \
| while read file month day hour line ; do
  date -d "$month $day $hour" "+%F %T%z ${file} ${line}" ;
done \
| sort
```

## Get command line switches

```
while getopts p:l:t: opt; do
  case $opt in
    p) pages=$OPTARG ;;
    l) length=$OPTARG ;;
    t) time=$OPTARG ;;
  esac
done

shift $((OPTIND - 1))
echo "pages is ${pages}"
echo "length is ${length}"
echo "time is ${time}"
echo "\$1 is $1"
echo "\$2 is $2"
```

Call this script as `./foo.sh -p "this is p" -l llll -t this\ is\ t foo bar`

# Files

These files can change the behavior of bash.

## .bash_profile

`~/.bash_profile` is executed every time you log into the system or initiate a shell. Inclusion of things that write to stdout is allowed here.

If you want to write scripts that change your interactive shell environment, such as changing your CWD, define functions here instead of using stand-alone scripts.

```
PS1="\u@\h:\w$ "
TMOUT="1800" # timeout variable
```

## .bashrc

`~/.bashrc` is executed every time you open a sub-shell. It **should not** output any text, otherwise certain things (eg: scp) will fail.

## ~/.inputrc

This file defines some bash behaviors. It also affects some other tools.

```
# Ignore case while completing
set completion-ignore-case on
```

# Links

- Command Line Quicksheet: <http://www.pixelbeat.org/cmdline.html>
- Tons of BASH examples: <http://mywiki.wooledge.org/BashFAQ>
- [Bash Manual: Bash Variables](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html)
- Bash pitfalls: <http://mywiki.wooledge.org/BashPitfalls>
- Bash prompt howto, including colors: <http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html>
