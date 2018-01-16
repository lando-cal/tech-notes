Notes and tips about working with the .deb package format

# Examples

## Show installed package versions

```
# -V = sort by version (GNU sort only)
/usr/bin/dpkg-query -W --showformat '${Package} ${Version}\n' | sort -k2 -V | column -t
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

## Show reverse dependencies of a package

```
apt-cache rdepends ec2-api-tools
```

## Show reverse dependencies of installed package

```
aptitude why openjdk-7-jre-headless
```

## Re-install many packages and validate that they were re-installed

When `apt-get install --reinstall` isn't good enough, this is the next option. This **should not** be done unless you're willing to reload the system if it fails.

```
# Generate a list of packages
dpkg -l | grep 'python-' > dpkg-l-python ;

# Remove and re-install each individual package one at a time
awk '{print $2,$3}' dpkg-l-python |
  while read -r p v ; do
    echo "Working on $p version $v" ;
    sudo dpkg --purge --force-depends "$p" ;
    sudo apt-get install "${p}=${v}" ;
  done ;

# Validate that all packages are re-installed with the right version
awk '{print $2,$3}' dpkg-l-python |
  while read -r p v ; do
    dpkg -l "$p" | grep "$v" || echo "ERROR: Problem with $p $v" ;
  done ;
```

# Links

- <https://wiki.debian.org/RPM>
