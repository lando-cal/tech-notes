"RRDtool is the OpenSource industry standard, high performance data logging and graphing system for time series data. RRDtool can be easily integrated in shell scripts, perl, python, ruby, lua or tcl applications." - <https://oss.oetiker.ch/rrdtool/index.en.html>

# Acronyms

- cs = consolidation function
- ds = data source
- dst = data source type
- rra = round robin archive

# Examples

## Reconfigure the X-axis precision of an RRD

Assuming the first value (eg: 5856) is the value you want and 244 is the value you currently have, reconfigure data index 0,1,2:

```
sudo rrdtool tune coral/pkts_in.rrd "RRA#0:+$((5856-244))" "RRA#1:+$((20160-244))" "RRA#2:+$((52704-244))"
```

# Links

- <https://oss.oetiker.ch/rrdtool/tut/rrd-beginners.en.html>
