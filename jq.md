"jq is a lightweight and flexible command-line JSON processor." - <https://stedolan.github.io/jq/>

# Examples

## Pretty print a json file

```
cat foo.json | jq .
```

## Grab the first element of an array, and print the 'timestamp' field of that element.

```
cat foo.json | jq -s '.[0] | {timestamp}'
```

## Use mco to find packages of a certain version on a certain OS

```
mco rpc package status package=apt -j -F lsbdistcodename=trusty | jq -c '.[] | select(.data.ensure == "1.0.1ubuntu2") | { version: .data.ensure, hostname: .sender }'
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

```
create_json() {
  local user=$1
  local host=$2
  local more_stuff=$3
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
