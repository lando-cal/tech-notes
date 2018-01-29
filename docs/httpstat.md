"curl statistics made simple" - <https://github.com/reorx/httpstat>

# Usage

## Simple usage

```
$ httpstat http://hoherd.com/
Connected to 192.30.252.153:80 from 127.0.0.1:61646

HTTP/1.1 200 OK
Server: GitHub.com
Date: Mon, 29 Jan 2018 23:24:52 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 405
Vary: Accept-Encoding
Vary: Accept-Encoding
Last-Modified: Tue, 04 Apr 2017 16:43:44 GMT
Access-Control-Allow-Origin: *
X-GitHub-Request-Id: F0D0:1973:5CF2FD:846C00:5A6FAD44
Expires: Mon, 29 Jan 2018 23:34:52 GMT
Cache-Control: max-age=600
Accept-Ranges: bytes

Body stored in: /var/folders/2t/rnzxpxd54y7832mx_xjvxl30bb2qzp/T/tmphVaBFx

  DNS Lookup   TCP Connection   Server Processing   Content Transfer
[     5ms    |       0ms      |       237ms       |        1ms       ]
             |                |                   |                  |
    namelookup:5ms            |                   |                  |
                        connect:5ms               |                  |
                                      starttransfer:242ms            |
                                                                 total:243ms
```

# See also

- [curl](curl) - what httpstat wraps to get its stats
