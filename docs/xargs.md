title: Xargs

xargs issues commands with the STDIN as arguments, by default appended to the end of the command.

# Examples

## Get the type of each listing from ls

```
ls | xargs file
```

## Handle spaces and use the arg as something other than the last token

The `-I` argument takes a string to use as a delimiter for any input.

```
ls | xargs -I {} mv "{}" ~/some/dir/
```

## Pass 5 args to each echo command, and never do more than 3 echo processes at a time

```
echo {1..100} | xargs -n5 -P3 echo
```

## use sed to change git files containing a certain string

This uses GNU `sed -i`, on macOS you should use `sed -i ''` or `gsed -i`.

```
git grep -l 192.168.5 | xargs sed -i 's/192.168.5/172.18.0/'
```

## Issue the same command several times in parallel

This takes 1 directory as input and starts a sub-shell that cd's to the directory and runs a command. Up to 4 subhells are run in parallel. This is very similar to the [GNU parallel](https://www.gnu.org/software/parallel/) command.

```
find ~/code/ -mindepth 1 -maxdepth 1 -type d |
xargs -I {} -n1 -P4 bash -c "cd {} ; make install-hooks ;"
```
