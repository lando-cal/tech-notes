Notes and tips about working with the .deb package format

# Examples
## Show installed package versions

```
/usr/bin/dpkg-query -W --showformat '${Package} ${Version}\n'
```

## List files in package that is installed

```
dpkg-query -L klibc-utils
```

## List files in package that is not installed

```
dpkg -c package.deb
```

## List files in packages that are available in configured repositories

```
apt-file list package_name
```
