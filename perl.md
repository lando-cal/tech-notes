Practical Extraction and Reporting Language

Special Variables
-----------------

-   "That thing": \$\_
-   Record Separator: \$/

Techniques
----------

### Assign an array to some matches

`@array_of_matches = ($source_string =~ m/..pattern../g);`

### Assign several variables to some matches

`my ($num, $a, $t) = ($_ =~ m/([0-9]*)\. (.*) - (.*)\.mp3/) ;`

### Iterate a hash

`while(($key, $value) = each(%$_)){`\
`    print "$value is $key\n" ;`\
`}`

### Print out a file with line numbers

`cat ~/.bash_history | perl -nle 'print "$.\t$_";'`

This should probably be done with [`nl`](nl "wikilink") `.bash_history`
instead.

### Edit a file in-place

To change all instances of "foo" to "bar":

`perl -i -pe 's/foo/bar/g' filename.txt`

### Remove blank lines from a file

`perl -pi -e "s/^\n//" file.txt`

### Remove lines from a file that match a certain regex

`perl -i -pe 'if ($_ =~ m/string to remove/ ){$_ = "";}' filename.txt`

### Sort a line by spaces

See [bash](bash "wikilink") for a bash-only way

`echo -n "whiskey tango foxtrot " | perl -e '$/=" "; @foo = `<STDIN>`; print (sort(@foo)); print "\n";'`

### Sort records in a file that are separated by a blank line

`#!/usr/bin/perl`\
`$/ = "\n\n" ;`\
`my @input = (`<STDIN>`) ;`\
\
`my @sorted = sort { lc($a) cmp lc($b) } @input ;`\
\
`foreach (@sorted) {`\
`    if (length($_) > 10) { print "$_"; }`\
`}`

### Subtract two from the last octet of a MAC address

`for X in 24:b6:fd:ff:b7:f`` ; do echo -n "${X} - 2 = " ; echo ${X} | perl -ne '@foo = split(":",$_); $foo[5] = sprintf("%02x", (hex($foo[5]) - 2)) ; $new = join(":",@foo); print "$new\n";' ; done ;`

### Add one to the last octet of a MAC address

`for X in 24:b6:fd:ff:b7:c`` ; do echo ${X} | perl -ne '@foo = split(":",$_); $foo[5] = sprintf("%02x", (hex($foo[5]) + 1)) ; $new = join(":",@foo); print "$new\n";' ; done ;`
