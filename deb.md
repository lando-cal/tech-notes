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

## Find a file available inside packages that are available in configured repositories

```
apt-file find libmysqlclient.so
```

## Show a list of installed packages

```
dpkg --list
```

## Show which package a file came from

```
dpkg -S /bin/bash
```

## List packages available in the repository

```
apt-cache dumpavail
```

## Show information about a package

```
apt-cache show coreutils
```

# Links
- [https://wiki.debian.org/RPM](https://wiki.debian.org/RPM)
