[[Redhat]] Package Manager is a format for software distribution.

== Tricks ==

=== Show a list of enabled repositories ===
 yum repolist

=== Show a list of available repositories ===
 yum repolist all

=== Show all installed packages, their versions and their source repo ===
 yum list installed

=== List available packages and the repo they come from ===
 yum list available | grep jre

=== Show all duplicates in a search ===
This is a good way to get a complete list of packages that are available that match a certain string
 yum --showduplicates search thrift

=== Query available packages in a given repository ===
 yum --disablerepo="*" --enablerepo="epel" list available

=== Upgrade and skip broken dependencies ===
 yum upgrade -y --skip-broken

=== Upgrade and skip certain packages ===
 yum upgrade --exclude=*rabbitmq*

=== Check for package conflicts ===
install yum-utils, then run package-cleanup

=== Find a package that includes a specific command or file ===
 yum whatprovides "*/filename"

=== Check for groups of packages ===
yum grouplist

=== Enable optional installs in groups ===
Add <tt>group_package_types=mandatory,default,optional</tt> in /etc/yum.conf

=== Install a local file using yum ===
 yum localinstall whatever.rpm

=== Auto-updates for Centos5 ===
yum-updatesd

=== Auto-updates for Centos6 ===
yum-cron

== See Also ==

* [[rpm]] - interact with rpms directly
* https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/sec-Managing_Yum_Repositories.html
