An awesome host inspection tool, with tcpdump like tool and an interface similar to [[top]] et al.

-  http://www.sysdig.org/

## Installation - CentOS
Their shell script installs epel from a 3rd party source, so it's best to use this method instead:

    rpm --import https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public && \
    curl -s -o /etc/yum.repos.d/draios.repo http://download.draios.com/stable/rpm/draios.repo && \
    yum -y install kernel-devel-$(uname -r) && \
    yum -y install sysdig

## Examples
### Simple usage
    sysdig
### Write a system trace file
    sysdig -w tracefile.scap
### Replay a tracefile
    sysdig -r tracefile.scap
### Show filters
    sysdig -l
### Show activity for access to a given file
    sysdig -l fd.name=/etc/hosts
### Show shell commands for all users
    sysdig -pc -c spy_users
### Spy on a user and exclude a process
    sysdig -pc -c spy_users proc.name!=gmetric

Or exclude multiple processes

    sysdig -pc -c spy_users "not proc.name in ( gmetric, awk, sed, grep )"

### Show a top like interface
    csysdig

## Links
-  https://github.com/draios/sysdig/wiki
-  https://github.com/draios/sysdig/wiki/Sysdig%20Examples
-  http://man7.org/linux/man-pages/man8/sysdig.8.html
-  [https://www.youtube.com/watch?v=TX6Y8E9ijkk Getting Started With Sysdig]
-  [https://www.youtube.com/watch?v=UJ4wVrbP-Q8 Getting Started With Csysdig]
