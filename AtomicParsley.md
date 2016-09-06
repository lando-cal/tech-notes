[AtomicParsley](http://atomicparsley.sourceforge.net/) is a lightweight command line program for reading, parsing and setting metadata into MPEG-4 files.

# Examples

## Set metadata on multiple files

Unfortunately the syntax of this tool requires you to edit one file at a time, so you have to iterate each item of an album using shell loops or `xargs` or whatever you prefer.

```
for file in *.m4a ; do
  AtomicParsley "${file}" --artist "Various Artists" ;
done ;
```
