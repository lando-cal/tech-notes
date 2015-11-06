Redhat Package Manager is a format for software distribution.

# Tricks
## Show installed keys

```
rpm -qa gpg-pubkey
```

## Show extended info about all keys

```
rpm -qa gpg-pubkey | xargs -n1 -P1 rpm -qi
```

## Show information about an rpm file

```
rpm -qpi
```

## Show all installed packages and when they were installed

```
rpm -qa --last
```

## Show information about the installed wget package

```
rpm -qi wget
```

## Output formatted information about packages

```
rpm -qa --queryformat "%{NAME} %{PACKAGER} %{URL}\n" tomcat7
```

More info on queryformat: [http://www.rpm.org/max-rpm/ch-queryformat-tags.html](http://www.rpm.org/max-rpm/ch-queryformat-tags.html)

## Show which package installed a file

```
rpm -qf /usr/bin/wget
```

## Show all files that were installed by package wget

```
rpm -ql wget
```

## Show all files in a package that isn't yet installed

```
rpm -qpl ~/downloads/wget-1.10.2-78.i586.rpm
```

## Show which documentation files get installed with a package

```
rpm -qd wget
```

## Show what has changed on the system since installing a package
This will verify file integrity and show you what has changed for each file.

```
rpm -V openssl
```

## Show installation and uninstallation scripts

```
rpm -qp --scripts foo.rpm
```

## Check the integrity of an RPM

```
rpm -K ~/downloads/filename.rpm
```

## Show which packages are hogging all the space

```
rpm -qa --queryformat "%{SIZE} %{NAME}\n" |sort -rn |head -n50 | column -t
```

## Show a table about RPM files versions and creators in a directory

```
rpm -qp --queryformat "%{NAME},%{VERSION},%{PACKAGER}\n" * | column -s, -t
```

## Show what files were installed into /var/log

```
rpm -qa --filesbypkg | grep " /var/log" # space before /var is necessary to weed out things like /usr/var
```

## Rebuild a corrupt rpm db

```
rm -rf /var/lib/rpm/__db*
rpm --rebuilddb
```

# See Also
- How to create RPMs - [http://fedoraproject.org/wiki/How_to_create_an_RPM_package](http://fedoraproject.org/wiki/How_to_create_an_RPM_package)
- yum - supplement to rpm command
