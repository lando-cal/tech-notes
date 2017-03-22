tool for listing hardware information and decoding it into human readable form. This tool decodes the DMI information.

# Examples

## Show system serial number

```
sudo dmidecode -t system | grep Serial
sudo dmidecode -s system-serial-number
```

## Show memory info including max installable

```
sudo dmidecode -t memory
```

## Show bios version

You may need to grep for a different string, but even then it doesn't always show the info because not all machines support this.

```
sudo dmidecode -t bios | grep -i revision
```

## Shower power supply information

This doesn't always work. Some power supplies are not supported.

```
dmidecode -t 39
```

# See Also

## Show all keywords and their values:

```
# -s without a keyword lists all keywords
# -s with a keyword shows only the value of that keyword
dmidecode -s |& grep '^  ' | while read -r X ; do echo $X: $(sudo dmidecode -s $X) ; done ;
```

- [lshw](lshw) - list hardware
