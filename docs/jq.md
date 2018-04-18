Title: jq

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

This example could be used as an alternative to grep, where only the value of a key/value pair is matched.

```
mco rpc package status package=apt -j -F lsbdistcodename=trusty |
  jq -c '
    .[] |
    select(.data.ensure == "1.0.1ubuntu2") | {
      version: .data.ensure, hostname: .sender
    }
  '
```

## Print only objects whose name matches a string

This example echoes some yaml, uses python to convert it to json, then filters matching data using `jq`. It could be used as an alternative to grep, where only the key of a key/value pair is matched.

```
echo "
data:
  - This is a string, not an object, and contains the substrings foo and bar
  - name: foo_name
    value: foo_value
  - name: bar_name
    value: bar_value" |
python -c "import yaml, sys, json; print json.dumps(yaml.safe_load(sys.stdin))" |
jq '
  .["data"][] |
  select(type=="object") |
  select (.name | . and contains("bar_n"))
'
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

## Render yaml with anchors as json data

This example shows how you can use python and jq to view the result of dereferenced yaml anchors, a construct that is not supported by json. This example is less about how to use `jq` syntaxes, and more about how it can be used to view data that is otherwise difficult to sort through.

```
echo "
job1: &template
  directory: /tmp
  extra_parameters: nosuid,noatime
  remote_host: 10.1.1.1
  user: nobody
job2:
  <<: *template
  remote_host: 10.2.2.2
job3:
  <<: *template
  remote_host: 10.3.3.3
" |
python -c "import yaml, sys, json; print json.dumps(yaml.safe_load(sys.stdin))" |
jq -S .
```

## Select matches, and print a subset of values

```
jq '.[] | select(.data.ensure != "purged") | [.sender,.data.ensure]' $*
```

## Output bare values for use as inputs

This is a contrived example, the better way to get this info would be `awless list instances --format tsv --columns name,privateip,launched`

```
$ awless list instances --format json | jq -r '.[] | "\(.Name) \(.PrivateIP) \(.Launched)"' | column -t
salt-master       172.18.9.48   2015-04-10T21:28:03Z
consul-server-01  172.18.9.116  2015-05-15T06:13:19Z
consul-server-02  172.18.9.117  2015-05-15T06:13:19Z
consul-server-03  172.18.9.118  2015-05-15T06:13:19Z
```

# See Also

- [Tutorial](https://stedolan.github.io/jq/tutorial/)
