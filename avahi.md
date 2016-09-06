The Avahi [mDNS/DNS-SD](https://en.wikipedia.org/wiki/Multicast_DNS) daemon implements Apple's Zeroconf architecture (also known as "Rendezvous" or "Bonjour").

# Tips

After installing avahi-daemon it may not start. To fix this you may need to run `service messagebus start`

[Service types](https://github.com/lathiat/avahi/blob/master/service-type-database/service-types) are defined in `/usr/share/avahi/service-types`

# Service configs

Correctly formatted and named files in `/etc/avahi/services/whatever.service` are loaded on the fly, no need to restart `avahi-daemon`. If your service doesn't immediately show up, check syslog for errors.

```
<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
  <name replace-wildcards="yes">%h</name>
  <service>
    <type>_ssh._tcp</type>
    <port>22</port>
  </service>
  <service>
    <type>_http._tcp</type>
    <port>80</port>
  </service>
</service-group>
```
