Title: q

"q - Text as Data" - <http://harelba.github.io/q/>

# Examples

## Format the Pagerduty incidents.csv to be more readable

```
# -d, = comma delimited input
# -H  = use the headings found in the input csv files
# -T  = tab delimited output
# -f  = python 2 format strings to be applied to 1-indexed output fields
$ q -d, -H -T -f '1=https://pagerduty.com/incidents/%s,2=alerted at %s,3=Description: %s' 'select id,created_on,description from incidents.csv order by created_on asc limit 5'
https://pagerduty.com/incidents/P66XNLT    alerted at 2017-12-04T00:04:07-08:00    Description: proxy0302: 200 Status Code Proxy Log Watcher: Matches found in last run met or dropped below 0.0, dropping to 0.0 for 10 minutes at 12:00AM https://server.pingdom.com/a/3103869181
https://pagerduty.com/incidents/PLUG344    alerted at 2017-12-04T04:14:05-08:00    Description: sandbox-apigateway00: API Gateway Error Watcher: Occurrences met or exceeded 10.00 /min, increasing to 15.82 /min for 10 minutes at 04:10AM https://server.pingdom.com/a/3104379391
https://pagerduty.com/incidents/PT13M2B    alerted at 2017-12-04T06:48:14-08:00    Description: hadoop-r21: Hadoop Resource Monitor: Lostnodes met or exceeded 4.0, increasing to 4.0 at 06:47AM https://server.pingdom.com/a/3104686551
https://pagerduty.com/incidents/P3RLOTT    alerted at 2017-12-04T08:56:07-08:00    Description: hadoop-c05: /srv Disk Usage: Disk Capacity met or exceeded 90%, increasing to 90% for 10 minutes at 08:50AM https://server.pingdom.com/a/3104929931
https://pagerduty.com/incidents/PNOJZKC    alerted at 2017-12-04T09:02:21-08:00    Description: sjc-http2: HTTP 500 error Watcher: Occurrences met or exceeded 10.00 /min, increasing to 31.91 /min for 10 minutes at 09:00AM https://server.pingdom.com/a/3104941911
```

## Format pagerduty events as HTML for pasting into confluence for issue response tracking

`pagerduty-csv-download` opens your browser and downloads the csv file for the last week of events. You'll have to change companyname to whatever your company URL is.

`pagerduty-csv-to-html` uses `q` to reformat the csv into HTML lists you can paste into the source editor of your HTML friendly CMS like Confluence.

This uses BSD relative date syntax, you'll have to change it for linux.

```
pagerduty-csv-download() {
  rm -f incidents.csv
  TZ=America/Los_Angeles
  past="$(date -v-7d "+%FT00:00:00")"
  present="$(date "+%FT00:00:00")"
  open "$(date "+https://companyname.pagerduty.com/api/v1/reports/raw/incidents.csv?since=${past}&until=${present}&time_zone=${TZ}")"
}
pagerduty-csv-to-html() {
  q \
    -H \
    -d',' \
    -D' ' \
    -f '1=<li>%s,2=<a href \"https://companyname.pagerduty.com/incidents/%s\">,3=%s</a>,4=%s<ul><li>...</li></ul></li>' \
    'select substr(created_on,12,5),id,id,description from incidents.csv order by created_on asc' | tail -n 50 | sed 's/href /href=/;s/> />/'
}
```

## Select count of daily alerts by date from PagerDuty incidents.csv

```
q -H --delimiter=',' -O --output-delimiter=',' 'select substr(created_on,0,11) as date,count(substr(created_on,0,11)) as count from incidents.csv group by date'
```
