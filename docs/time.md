# Notes about time technologies

# [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)

ISO 8601 Data elements and interchange formats – Information interchange – Representation of dates and times is an international standard covering the exchange of date and time-related data.

## ISO 8601 format examples

See the [ISO 8601 wikipedia page](https://en.wikipedia.org/wiki/ISO_8601) for many examples. Much of the content in this section was taken from that article.

One notable syntax is that the letter T should always precede times. This aids in parsing, and distinguishes between month and minute, which are both shortened to M.

Another notable syntax is the use of Z to mean a timezone offset of 0 hours, or GMT.

### Single points in time

```
$ for fmt in {date,hours,minutes,seconds,ns} ; do
    bash -x -c "
      TZ=$(
        awk '$1 !~ /^#/ {print $3}' /usr/share/zoneinfo/zone.tab |
        sort -R |
        head -n 1
      ) \
      date --iso-8601=${fmt}
    " ;
  done ;
+ TZ=America/Paramaribo
+ date --iso-8601=date
2016-08-09
+ TZ=Africa/Dakar
+ date --iso-8601=hours
2016-08-09T21+00:00
+ TZ=Indian/Kerguelen
+ date --iso-8601=minutes
2016-08-10T02:58+05:00
+ TZ=Pacific/Saipan
+ date --iso-8601=seconds
2016-08-10T07:58:48+10:00
+ TZ=Pacific/Midway
+ date --iso-8601=ns
2016-08-09T10:58:48,503878101-11:00
```

- Week: 2016-W32
- Date with week number: 2016-W32-2
- Month and day without year: -12-31

### Durations, or ranges of time

Durations are a component of time intervals and define the amount of intervening time in a time interval.

#### Examples:

- P10Y - a duration of ten years.
- P5DT12H - a duration of five days and twelve hours.
- P3Y6M4DT12H30M5S - a duration of three years, six months, four days, twelve hours, thirty minutes, and five seconds.
- P1M - one month.
- PT1M - one minute.

### Time intervals

A time interval is the intervening time between two time points. There are four ways to express a time interval:

- Start and end, such as `2007-03-01T13:00:00Z/2008-05-11T15:30:00Z`
- Start and duration, such as `2007-03-01T13:00:00Z/P1Y2M10DT2H30M`
- Duration and end, such as `P1Y2M10DT2H30M/2008-05-11T15:30:00Z`
- Duration only, such as `P1Y2M10DT2H30M`, with additional context information

### Repeating intervals

Repeating intervals are formed by adding `R[n]/` to the beginning of an interval expression. Such as `R5/2007-03-01T13:00:00Z/2008-05-11T15:30:00Z`. The `n` can be omitted if the interval should repeat forever.

# RFC 3339

RFC 3339 is considered a profile of ISO 8601\. It defines a profile of ISO 8601 for use in Internet protocols and standards. It explicitly excludes durations and dates before the common era. The more complex formats such as week numbers and ordinal days are not permitted.

- <https://tools.ietf.org/html/rfc3339>

# Examples

## Quick and dirty time sync in Linux for when NTP is blocked.

```
date -s $(curl -s -D - google.com | sed '/Date:/s/.*Date: //p ; d')
```

# Links

## Reading

- [Understanding and mitigating NTP-based DDoS attacks](https://blog.cloudflare.com/understanding-and-mitigating-ntp-based-ddos-attacks/)
- [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
- [Date and Time on the Internet: Timestamps - RFC 3339](https://tools.ietf.org/html/rfc3339)
- [Examples of date (GNU)](https://www.gnu.org/software/coreutils/manual/html_node/Examples-of-date.html)
- [man date (linux)](http://man7.org/linux/man-pages/man1/date.1.html)
- [man date (freebsd)](http://www.freebsd.org/cgi/man.cgi?date)
- [Falsehoods programmers believe about time](http://infiniteundo.com/post/25326999628/falsehoods-programmers-believe-about-time)
- [More falsehoods programmers believe about time; "wisdom of the crowd" edition](http://infiniteundo.com/post/25509354022/more-falsehoods-programmers-believe-about-time)
- [International Earth Rotation and Reference Systems Service](https://www.iers.org)

## Videos

- [The Problem with Time & Timezones - Computerphile](https://www.youtube.com/watch?v=-5wpm-gesOY)

## Leap Seconds

- [Resolve Leap Second Issues in Red Hat Enterprise Linux](https://access.redhat.com/articles/15145)
- [Google Public NTP: Leap Smear](https://developers.google.com/time/smear)
- [Five different ways to handle leap seconds with NTP](https://developers.redhat.com/blog/2015/06/01/five-different-ways-handle-leap-seconds-ntp/)
- [The Unix leap second mess](http://www.madore.org/~david/computers/unix-leap-seconds.html)
