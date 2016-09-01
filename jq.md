"jq is a lightweight and flexible command-line JSON processor." - <https://stedolan.github.io/jq/>

# Examples

## Sort a json file

```
jq -S . foo.json
```

## Grab first element of an array, and print the value of 'timestamp' of that element.

```
echo '
[
  {
    "foo": "this is foo string",
    "timestamp": "this is the timestamp"
  },
  {
    "second element": "second element value"
  }
]' | jq '.[0].timestamp'
```

## Construct Flickr URLs from an API call

```
curl -s "https://api.flickr.com/services/rest/?"\
"&api_key=9c72f03c0583a34bd703bd82d8773cc0"\
"&format=json"\
"&method=flickr.photos.getRecent"\
"&nojsoncallback=1" |
  jq -S '
    .["photos"]["photo"][] |
    "https://flickr.com/photos/" + .owner + "/" + .id
  '
```

## Use mco to find packages of a certain version on a certain OS

```
mco rpc package status package=apt -j -F lsbdistcodename=trusty |
  jq -c '
    .[] |
    select(.data.ensure == "1.0.1ubuntu2") | {
      version: .data.ensure, hostname: .sender
    }
  '
```

## Other misc examples

```
jq '.[] | select(.data.ensure != "purged") | [.sender,.data.ensure]' $*
```

## Print only objects whose name matches a string

This example uses <https://github.com/solarkennedy/uq>

```
echo "
jobs:
  - name: foo
    value: foo job
  - name: bar
    value: bar job" |
uq | jq '.["jobs"][] | select(type=="object") | select (.name | . and contains("bar"))'
```

## Build a json entry from scratch

This uses bash paramber expansion and subshell syntax, and may not work in other shells.

```
create_json() {
  local user=${1:-${USER}}
  local host=${2:-${HOSTNAME}}
  local more_stuff=${3:-$(uname -a)}
  json=$(
    jq -c -n \
      --arg timestamp  "$(date "+%F %T%z")" \
      --arg host       "${host}" \
      --arg user       "${user}" \
      --arg more_stuff "${more_stuff}" \
      '{
        timestamp:  $timestamp,
        host:       $host,
        user:       $user,
        more_stuff: $more_stuff
      }'
  )
  echo "$json"
}
```

# See Also

- [Tutorial](https://stedolan.github.io/jq/tutorial/)
