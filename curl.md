curl is a tool to transfer data from or to a server, using one of the supported protocols (DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, TELNET and TFTP). The command is designed to work without user interaction.

# Examples

## Follow location redirects

    curl -L http://whatever

## Dump only headers

    curl -I http://whatever

## Show the HTTP code for a given request
This downloads 1 byte from the remote URI and shows the HTTP code, so it's a quick way to discover HTTP codes.

    curl --max-filesize 1 -s -w "%{http_code}\n" -o /dev/null http://www.example.com/

## Request a specific vhost from a server
This is useful for testing production code on non-production multi-tennant name based virtual hosts.

    curl -H www.domain.com http://example.com

## Get the length of the file to be downloaded

    curl -qI  https://www.google.com/index.php 2>/dev/null | awk '/Length/ {print $2}'

## Fetch only HTTP headers, not content

    curl -I http://www.example.com/some_huge_file.iso

## Send POST variables

    curl --data "user=foo&pass=bar" http://example.com/login.php

## Scrape URLs from a page
This appears to have problems with some strings. For instance, this doesn't catch the full https://acounts.google.com string.  The regex is correct according to http://regexpal.com, but egrep is apparently not handling it correctly.

    curl -s http://www.google.com | egrep -o '(((https?|ftp|gopher)://|(mailto|file|news):)[^’ <>\n"]+|(www|web|w3)\.[-a-z0-9.]+)[^’ .,;<>":]'
