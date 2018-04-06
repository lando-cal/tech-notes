# Wget

"GNU Wget is a free software package for retrieving files using HTTP, HTTPS, FTP and FTPS the most widely-used Internet protocols. It is a non-interactive commandline tool, so it may easily be called from scripts, cron jobs, terminals without X-Windows support, etc." - <https://www.gnu.org/software/wget>

# Examples

## Mirror site for local viewing

From the man page: to download a single page and all its requisites (even if they exist on separate websites), and make sure the lot displays properly locally, this author likes to use a few options in addition to -p:

```
wget -E -H -k -K -p http://<site>/<document>
```

## Download all images from a site

To politely download all images from within a current remote directory:

```
wget --wait=2 --random-wait --tries=0 --waitretry=30 -np -N -r -A.jpg http://www.site.com/directory/
```


## Simple use of cookies

Some servers that need referrers and cookies can be accessed by doing:

```
wget --save-cookies="cookies.txt" "foo.html
wget --load-cookies="cookies.txt" --referer="foo.html" "foo.mp3"
```

## Set default behavior

`~/.wgetrc` sets default parameter values

```
tries=0
continue=1
```
