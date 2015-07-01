Enterprise log consumption and analysis.
- http://www.splunk.com/

# Examples

## CFEngine runs per hour by version

    source="/var/log/messages" OR source="udp:514" "Starting CFEngine" earliest="-1w" | rex "Starting CFEngine (?<version>3.[0-9]+.[0-9]+).*" | timechart span=4h usenull=0 dc(host) by version

## Strip domain from hostname for consistent UQDNs
    rex mode=sed field=host "s/\.foo\.example\.com//"

## Count of records per hour by host

    earliest="-7d" | timechart span=1h count(_raw) by host

## Count of records per source by 5m with no limit on list

    earliest="-8h" | timechart span=5m count(_raw) by source limit=0

## Count of records per source with a given list

    earliest="-1d" source="/var/log/messages" OR source="udp:10514" OR source="udp:514" | timechart count by source

## Count of records per splunk server for a given time period
Stupidly, splunk doesn't support ISO date format by default (in the version I'm using).

    earliest="06/19/2015:3:0:0" latest="06/19/2015:3:3:0" | timechart count(_raw) by splunk_server

See also:
- http://docs.splunk.com/Documentation/Splunk/latest/Admin/Propsconf
- http://answers.splunk.com/answers/140493/timestamp-contain-t-between-date-and-time.html#answer-140495

## Count of kernel versions
Assuming you have a report that sends `kernel_version=$(uname -r)`:

    kernel_version | stats count(kernel_version) by kernel_version, host
