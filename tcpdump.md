Network sniffing tool.

## Syntax Examples

### Capture packets to and from an IP address
Only captures data that includes 1.2.3.4 as source or destination address

    tcpdump host 1.2.3.4

### Capture traffic that contains a given mac address
writes capfile.cap containing all traffic to or from the specified mac address on the network attached to eth1

    tcpdump -w capfile.cap -i eth1 ether host 00:03:fa:46:2c:08

### Filter packets from an existing capture
Filters port 53 packets out of the old capfile into the new

    tcpdump -r oldcapfile.cap -w newcapfile.cap port 53

### Capture all pop3 traffic and all traffic from a particular host
Captures all pop3 traffic and all traffic to or from the specified host on the first interface of a Mac OS X computer

    tcpdump -w foo.cap -i en0 ether host 00:03:9a:28:44:01 or port 110


### Capture all traffic not a mac address
Captures all traffic not from the host 00:1b:63:cd:83:2e, useful for filtering out your own traffic.

    tcpdump -i en1 not ether src 00:1b:63:cd:83:2e

### Capture LLDP traffic
This matches 2 bytes starting at the 12th byte against 88cc

    tcpdump -v -s 1500 -c 1  '(ether[12:2]=0x88cc)'

### Capture SYN packets

    tcpdump -n 'tcp[13] & 2!=0'

### Capture SYN/ACK packets

    tcpdump -n 'tcp[13]=18'

Or another way

    tcpdump 'tcp[tcpflags] && tcp-syn != 0'

Or capture all SYN packets going only to two ethernet destinations:

    tcpdump 'tcp[13] & 2!=0 && (ether dst 00:22:64:f4:d0:70 or ether dst 00:22:64:f4:d0:6e)'

### Write capture to file and replay it at the same time

    sudo tcpdump -n 'host 216.200.102.84' -s 1500 -l -w - | tee logcopy.pcap | tcpdump -r -

### Write a circular buffer of traffic
This will write 5 files 1 mb each and loop through them as the destination for writing traffic. That is, the filenames do not indicate chronology.

    sudo tcpdump -C 1 -W 5 -w foo.cap

## Links
- http://www.danielmiessler.com/study/tcpdump/
