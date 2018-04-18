Title: youtube-dl

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

## Download songs longer than 30 minutes

The `--match-filter` only alters what gets downloaded, not what is displayed when using options like `-j`

```
youtube-dl -f bestaudio --match-filter 'duration > 1800' 'https://www.youtube.com/user/boyceavenue'
```

## Reformat a youtube channel into lines as "URL - Title"

```
youtube-dl -j --flat-playlist 'https://www.youtube.com/watch?v=CHMZW9kLpg0&list=PL1B627337ED6F55F0' |
  jq -S -r '"https://youtu.be/" + .id + " - " + .title'
```
