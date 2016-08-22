fortune is a unix command that displays a random fortune on the CLI.

# Make a fortune file

1. Create a file that has each fortune separated by a line containing only a `%` symbol.
2. Run `strfile fortunes.txt`, which will create `fortunes.txt.dat`
3. You can then see the fortunes with `fortune fortunes.txt`. This also works with many files in a single directory: `for file in *.txt ; do strfile "${file}" ; done ; fortune .`
