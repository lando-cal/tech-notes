super user do

# Examples
## \#includedir /etc/sudoers.d

```
#includedir /etc/sudoers.d
```

This line is in some sudoers files, and is not a comment. #includedir is a configuration directive. This directory does not like to have .conf files, so they should be flatly named. eg: 00_default

## Check sudoers for errors

```
visudo -c
```

## Show sudo rules that match for the given user

```
sudo -l -U username
```

The order shown is important. sudo picks the last matching rule. Rules are parsed in order from /etc/sudoers and all included files. Because of this, `#includedir /etc/sudoers.d` should be the last line in the /etc/sudoers file, and the order of the /etc/sudoers.d/ files will be important when fine tuning rules.

## Allow admins to run mtr without a password
Add the following line to /etc/sudoers

```
%admin ALL=(ALL)NOPASSWD:/usr/local/sbin/mtr
```

## Allow several groups and users to execute upstart commands

```
User_Alias UPSTART_USERS = %wheel, %sysadmin, %adm
UPSTART_USERS  ALL=(ALL)     NOPASSWD: /sbin/start
UPSTART_USERS  ALL=(ALL)     NOPASSWD: /sbin/stop
UPSTART_USERS  ALL=(ALL)     NOPASSWD: /sbin/initctl
UPSTART_USERS  ALL=(ALL)     NOPASSWD: /sbin/restart
```

## Run several commands with one sudo command

```
sudo -s -- "whoami ; whoami ;"
```

or

```
sudo -s -- <<EOF
whoami
whoami
EOF
```

or

```
sudo bash -c "whoami ; whoami ;"
```

# Links
- sudoers config - [http://ubuntuforums.org/showthread.php?t=1132821](http://ubuntuforums.org/showthread.php?t=1132821)
