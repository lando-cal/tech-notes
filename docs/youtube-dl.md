# youtube-dl

"Command-line program to download videos from YouTube.com and other video sites" - <https://github.com/rg3/youtube-dl/>

# Examples

## Show available media formats

```
youtube-dl -F 'https://youtu.be/LdCq6y1Uu5Y'
```

## Download the best quality within resolution bounds

```
youtube-dl -f 'bestvideo[height<=480]+bestaudio' 'https://youtu.be/-kgTCpv_W64'
```
