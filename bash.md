[Bash](Bash "wikilink") is the most common mainstream \*nix shell.

Tricks and Usage
----------------

The following can be seen by running: `stty` `-a`

-   ctrl-a - move cursor to the beginning of the line
-   ctrl-e - move cursor to the end of the line
-   ctrl-l - do a "clear" on the terminal window
-   ctrl-r - reverse history command search
-   ctrl-t - get status of foreground process
-   ctrl-w - delete previous word

### Remove leading zeroes

`for X in 00{1..50} ; do echo $((10#${X})) ; done ;`

Or...

`for X in {1..50} ; do Y=00${X} ; echo $(echo ${Y} | bc) is ${X} is ${Y} ; done ; `

### Convert base 36 to decimal

This converts the base 36 number z to a decimal value

`echo $((36#z))`

### Run a command for 5 seconds, then kill it

`ping -f & sleep 5 ; kill %1`

Alternatively, use the timeout command if it's available

`timeout 300 cmd`

### Test if a variable is empty

    if [[ -z "$var" ]]

### Date

For date stuff, see [date](date "wikilink"), because it's different
depending on platform.

### Show RANDOM statistics

`for X in {0..9999} ; do echo $(($RANDOM % 5 + 1)) ; done | sort |  uniq -c`

### named pipes

`mkfifo` `baz` `;` `ps` `aux` `>` `baz` then in another terminal `cat`
`baz`

### alternate redirection outputs

`exec 3> /tmp/baz ; ps aux >&3 # sends the output of ps aux to /tmp/baz`

### Show size of each user's home folder

`getent passwd | while IFS=: read -r user n uid n n home n ; do if [[ $uid -ge 500 ]] ; then printf "$user " ; du -sh $home ; fi ; done`

### Previous command's args

`mkdir temp ; cd !!:*`

Be aware of the location of the tokens. eg: `mkdir` `-p`
`{foo,bar}/{a,b,c}` `;` `stat` `!!:*` creates a problem because you
can't `stat` `-p` so you must:

`stat -p !!:2*`

### Debug a script

This will show everything bash is executing

`bash -x scriptname.sh`

Or debug with a function:

`function debug { if [ ${debug:-0} -gt 0 ] ; then echo $@ 2>&1 ; fi ; }`

### Find where all the inodes are

`find ~/ -type d -print0 | xargs -I %% -0 bash -c "echo -n %% ; ls -a '%%' | wc -l" >> ~/inodes.txt`

### Build and print an array

`array=("one");` `array+=("two"` `"three");` `echo` `"${array[@]}"`

### Show permissions in rwx and octal format

-   Linux: `stat` `-c` `'%A` `%a` `%n'` `filename`
-   OSX: `stat` `-f` `'%A` `%N'` `filename`

### Find the length of a variable

`echo ${#SHELL}`

### Tertiary type variables

`${V:-D} # means "return the value of the environment variable V or the string D if V isn't set.`

### Do a command, and if it returns false, so some more stuff

`while` `!` `command_that_will_fail` `;` `do` `something_else` `;`
`done` `;`

### Print two digit months

`echo` `{1..12}` may not work. If not, use `echo` `$(seq` `-w` `1` `12)`

### Get filename, extension or path

Taken from <http://mywiki.wooledge.org/BashFAQ/073>

### Rename files to a sequence and change their extension at the same time

`ls` `|` `while` `read` `-r` `line` `;` `do` `stub=${line%.*}` `;` `((`
`i` `+=` `1` `))` `;` `mv` `"${line}"` `"${i}-${stub}.txt3"` `;` `done`
`;`

    FullPath=/path/to/name4afile-00809.ext   # result:   #   /path/to/name4afile-00809.ext
    Filename=${FullPath##*/}                             #   name4afile-00809.ext
    PathPref=${FullPath%"$Filename"}                     #   /path/to/
    FileStub=${Filename%.*}                              #   name4afile-00809
    FileExt=${Filename#"$FileStub"}                      #   .ext

### Sort a line by spaces

See [perl](perl "wikilink") for how to do it with only pipes

:   `s=(` `whiskey` `tango` `foxtrot` `);` `sorted=$(printf` `"%s\n"`
    `${s[@]}|sort);` `echo` `$sorted`

### Calculate the difference between two dates

`let DIFF=($(date +%s -d 20120203)-$(date +%s -d 20120115))/86400 ; echo $DIFF`

### substring replace a variable

This is not regex, just a simple string replacement.

`${VAR//search/replace} # does all replacements`\
`${VAR/search/replace} # does only the first`\
`echo "Paths in your path: ${PATH//:/ }"`

### Subtract two from a MAC address

`printf -v dec "%d" 0x$(echo 00:25:9c:52:1c:2a | sed 's/://g') ; let dec=${dec}-2 ; printf "%012X" ${dec} | sed -E 's/(..)(..)(..)(..)(..)(..)/\1:\2:\3:\4:\5:\6/g'`

### Print the last for chars of a variable

-   `echo` `${foo:$((${#foo}-4))}`
-   `echo` `${foo:` `-4}` The space is necessary to prevent it from
    doing a completely different thing. See the next example...

### Print something else if a variable doesn't exist

-   `echo` `${foo:-foo` `isn\'t` `assigned}`
-   `echo` `${foo:-${bar}}`

This can even be recursively done…

-   `echo` `${foo:-${bar:-foo` `and` `bar` `are` `not` `assigned}}`

### Generate a zero padded random 2 byte hex number

`printf "%02X\n" $((RANDOM % 256))`

### grep many log files and sort output by date

`sudo grep cron /var/log/* | sed 's/:/ /' | while read file month day hour line ; do echo $(date --rfc-3339=seconds -d $month\ $day\ $hour) ${file} ${line} ; done | sort`

### Get command line switches

`while getopts p:l:t: opt; do`\
`  case $opt in`\
`  p)`\
`      pages=$OPTARG`\
`      ;;`\
`  l)`\
`      length=$OPTARG`\
`      ;;`\
`  t)`\
`      time=$OPTARG`\
`      ;;`\
`  esac`\
`done`\
\
`shift $((OPTIND - 1))`\
\
`echo "pages is ${pages}"`\
`echo "length is ${length}"`\
`echo "time is ${time}"`\
`echo "\$1 is $1"`\
`echo "\$2 is $2"`

Call this script as `./foo.sh` `-p` `"this` `is` `p"` `-l` `llll` `-t`
`this\` `is\` `t` `foo` `bar`

Files
-----

These files can change the behavior of bash.

### .bash\_profile

\~/.bash\_profile is executed every time you log into the system or
initiate a shell. Define functions here instead of using stand-alone
scripts if you want the changes made to persist after the termination of
the script. EG: if you cd inside of a function, the CWD will stay after
the function exits, but with a standalone bash script you'd keep your
pre-existing CWD.

`PS1="\u@\h:\w$ "`\
`TMOUT="1800" # timeout variable`

#### Example .bash\_profile file

    # .bash_profile is executed every time you log into a shell prompt.

    HISTSIZE=5000
    GREP_COLOR=always
    export PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH"; export PATH;
    GZIP="-9"; export GZIP;
    EDITOR="/usr/bin/vim"; export EDITOR;
    TERM=vt100 ; export TERM;
    export PS1="\[\e[33m\][\t] \u@\[\e[0m\]\h\[\e[33m\]:\w\[\e[0m\]\n$ " ;
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;32'

    set visible-stats on


    ### aliases ###

    alias datestamp="date +%Y-%m-%d-%H-%M-%S"
    alias apachectl="sudo apachectl"
    alias ll="ls -la"
    alias nmap="sudo nmap"
    alias mtr="sudo mtr --curses"
    alias s="screen -xR"


    ### Functions ###

    function mysql_to_csv() { sed -E 's#^\| +#"#;s# *\| $#"#;s# *\| *#","#g' ${1:-/dev/stdin}; } # converts a mysql shell output to csv, uses stdin or a filename
    function sort_space_list { for X in ${@:-$(cat /dev/stdin)} ; do echo ${X} ; done | sort | while read -r line ; do echo -n "${line} " ; done ; echo '' ; }
    function sprunge() { curl -F 'sprunge=<-' http://sprunge.us < "${1:-/dev/stdin}"; } # usage: sprunge FILE # or some_command | sprunge
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


    ### OSX Specific Functions and Aliases ###
    if [ $(uname) == "Darwin" ] ; then

        alias pbsort="pbpaste | sort -f | pbcopy"
        alias prowl="~/bin/prowl.pl -apikey=d9b3f5f8c51c0dacd6288801f0cf682b19ff0570 -event=`hostname -s` -notification"
        alias updatedb="sudo /usr/libexec/locate.updatedb"
        alias ovftool="/Applications/VMware\ OVF\ Tool/ovftool"
        alias tag_jpgs_unique="tag_images_unique.sh ~/{Dropbox/,}Pictures/Imported/*.JPG"
        alias plistbuddy="/usr/libexec/PlistBuddy"
        alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
        alias move_movies_to_e-tron="rsync -aP --remove-source-files /Users/dho/{Dropbox/Pictures/linked_photos/*/*/*,{Dropbox/,}Pictures/Imported}/*.{mov,MOV,avi,AVI} plata:/Volumes/E-Tron/Home_Movies/"

        function sl { mdfind "kMDItemDisplayName == '$@'wc"; }
        function skypesearch(){ skypeusername=$1; searchstring=$2; /usr/bin/env sqlite3 ~/Library/Application\ Support/Skype/${skypeusername}/main.db "select author, datetime(timestamp,'unixepoch','localtime'), body_xml from messages where body_xml like '%${searchstring}%' ;"; }

        ### Brew bash-completion
        if [ -f $(brew --prefix)/etc/bash_completion ]; then
            . $(brew --prefix)/etc/bash_completion
        fi

        ### Plata specific stuff ###
        if [ $(hostname) == "plata.local" ] ; then
            alias ss="skypesearch daniel.austin"
            alias gpx_from_downloads_to_dropbox="mv ~/Dropbox/Downloads/*.gpx ~/Dropbox/Documents/gpx/ ; cd ~/Dropbox/Documents/gpx/ && rm -f *Z last-10-merged.gpx ; ./gpx-rename.sh "[A-Za-z]*.gpx" ; ./gpx-merge-last-10.sh "
        fi

    fi

### .bashrc

\~/.bashrc is executed every time you open a sub-shell. It **should
not** output any text, otherwise certain things (eg:
[scp](ssh#scp "wikilink")) will fail.

### .inputrc

:   <code>\# Ignore case while completing
:   set completion-ignore-case on</code>

Links
-----

-   Command Line Quicksheet: <http://www.pixelbeat.org/cmdline.html>
-   Tons of BASH examples: <http://mywiki.wooledge.org/BashFAQ>
-   Bash pitfalls: <http://mywiki.wooledge.org/BashPitfalls>
-   Bash prompt howto, including colors:
    <http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html>

<Category:CLI> <Category:Linux> <Category:Nix>
