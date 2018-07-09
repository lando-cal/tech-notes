Title: iptables

iptables is the built-in linux firewall.

# Examples

- How to simulate a slow network link: <http://blogs.kde.org/node/1878>

## Allow MySQL

```
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 3306 -j ACCEPT
```

## SSH blocking

Better idea: [fail2ban](https://www.fail2ban.org)

Basically, it lets people connect with SSH 5 times within a minute, but with a mandatory 5 second wait before connection attempts.  Once they hit 5 attempts in a minute they get banned for an hour. Several IP ranges are exceptions where access is always allowed.

```
iptables -I INPUT 1 -s 172.16.0.0/16 -m state --state NEW -p tcp -m tcp --dport 22 -j ACCEPT
iptables -I INPUT 2 -s 17.1.2.0/27   -m state --state NEW -p tcp -m tcp --dport 22 -j ACCEPT
iptables -I INPUT 3 -s 18.3.4.0/27   -m state --state NEW -p tcp -m tcp --dport 22 -j ACCEPT
iptables -I INPUT 4 -s 19.5.6.0/24   -m state --state NEW -p tcp -m tcp --dport 22 -j ACCEPT
iptables -N SSH
iptables -N SSH_ABL
iptables -A SSH -m recent --name SSH_ABL --update --seconds 3600 -j REJECT
iptables -A SSH -m recent --name SSH --rcheck --seconds 60 --hitcount 5 -j SSH_ABL
iptables -A SSH_ABL -m recent --name SSH_ABL --set -j LOG --log-level warn --log-prefix "ABL: +SSH: "
iptables -A SSH_ABL -j REJECT
iptables -A SSH -m recent --name SSH --rcheck --seconds 5 -j LOG --log-level warn --log-prefix "RATE: "
iptables -A SSH -m recent --name SSH --update --seconds 5 -j REJECT
iptables -A SSH -m recent --name SSH_ABL --remove -j LOG --log-level warn --log-prefix "ABL: -SSH: "
iptables -A SSH -m recent --name SSH --set -j ACCEPT
iptables -A INPUT -m state --state NEW -p tcp -m tcp --dport 22 -j SSH
iptables -L
```

## Show all tables

Not all tables are shown by default. To view all, issue the following commands as root:

```
iptables -vL -t filter
iptables -vL -t nat
iptables -vL -t mangle
iptables -vL -t raw
iptables -vL -t security
```
