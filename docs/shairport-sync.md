Title: shairport-sync

"AirPlay audio player. Shairport Sync adds multi-room capability with Audio Synchronisation" - <https://github.com/mikebrady/shairport-sync>

# Example

## shairport-sync in docker

This is a really easy way to get shairport-sync running on Linux. The container is 12mb.

```
docker run \
  --rm \
  --detach \
  --network=host \
  --device /dev/snd \
  -e AIRPLAY_NAME="shairport ${HOSTNAME}" \
  kevineye/shairport-sync
```
