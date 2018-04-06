# CentOS

# CentOS 7

- Released 2014-07-07

## New things in CentOS 7

- [firewalld](firewalld) manages the firewall
- [hostnamectl](hostnamectl) changes the hostname and applies the setting immediately
- [journalctl](journalctl) shows log files of services launched by systemd
- [systemctl](systemctl) manages systemd services

## Initial setup

Set up some base parameters on a fresh instance

```
yum install -y bash-completion bc curl git lsof mlocate mutt net-snmp ntpd smartmontools strace sysstat vim wget  
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime  
ntpdate {0..3}.pool.ntp.org  
systemctl start ntpd
```

# CentOS 6

- Released 2011-07-10

## CentOS 6 Initial Setup
----------------------

```
yum install -y ntp  
chkconfig --levels 345 ntpd on && ntpdate time.apple.com && service ntpd start  
yum upgrade -y  
yum install -y arping avahi avahi-tools bc bind-utils curl elinks fping lsof net-snmp man mlocate mutt openssh openssh-clients openssh-server perl-Crypt-SSLeay perl-libwww-perl rsync strace vim wget yum-cron
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime  
chkconfig --levels 345 yum-cron on && service yum-cron start  
yum install -y dcfldd nfs-utils smartmontools dmidecode lshw dstat htop iotop  
chkconfig --levels 345 smartd on && service smartd start
```

## Tweaks and Tricks

### Get past protected lib problems

`yum update --setopt=protected_multilib=false --skip-broken`

### Enable DHCP Hostname for DNS resolution

add "`DHCP_HOSTNAME=whatever`" to
/etc/sysconfig/network-scripts/ifcfg-eth0

### Install OS from USB

-   From Windows: <http://iso2usb.sourceforge.net/>
-   From Linux: <https://fedoraproject.org/wiki/Livecd-iso-to-disk>

### Show installed repository keys

`rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n'`

### DHCP with DDNS hostname

Model your /etc/sysconfig/network-scripts/ifcfg-eth0 like this:

```
TYPE=Ethernet
DEVICE=eth0
ONBOOT=yes
BOOTPROTO=dhcp
# Without the following line, dhclient will not update /etc/resolv.conf and may not get an IP address at all
DHCP_HOSTNAME=some_hostname
```

- To configure your hostname, edit /etc/sysconfig/network and add HOSTNAME=<fqdn>
- You also may need to delete these files:

```
rm -f /etc/dhclient-eth?.conf /var/lib/dhclient/dhclient-eth?.leases /etc/udev/rules.d/70-persistent-net.rules /etc/sysconfig/network-scripts/ifcfg-eth1
```

### Configuration to auth against [Microsoft](/wiki/Microsoft "wikilink") AD

- <http://www.uncompiled.com/using-winbind-in-centos-6-for-active-director> worked perfectly with [samba](samba) and [winbind](winbind)

### Bond Configs

```
$ cat /etc/modprobe.d/bond0.conf  
alias bond0 bonding  
options bond0 max_bonds=1 fail_over_mac=2 mode=1 num_grat_arp=2 primary=em1 primary_reselect=1 arp_validate=1 arp_interval=100 arp_ip_target=10.1.5.15,10.1.1.1
```

# See Also

- [chkconfig](chkconfig)
- [rpm](rpm)
- [selinux](selinux) - <http://wiki.centos.org/HowTos/SELinux>
- [yum](yum)
