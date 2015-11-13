Notes and tips about working with the apt package format

# Show installed package versions

```
/usr/bin/dpkg-query -W --showformat '${Package} ${Version}\n'
```
