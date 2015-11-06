# Notes about time tech
# Links
- [Understanding and mitigating NTP-based DDoS attacks](https://blog.cloudflare.com/understanding-and-mitigating-ntp-based-ddos-attacks/)

# Quick and dirty time sync for when NTP is blocked.

```
date -s $(curl -s -D - google.com | sed '/Date:/s/.*Date: //p ; d')
```
