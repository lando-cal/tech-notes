ZooKeeper is a high-performance coordination service for distributed applications. - <https://zookeeper.apache.org/doc/trunk/>

# Examples

## Lists brief details for the server and connected clients

`echo 'stat' | nc localhost 2181`

## View a list of variables that could be used for monitoring the health of the cluster

`echo 'mntr' | nc localhost 2181`

## List full details for the server

`echo 'srvr' | nc localhost 2181`

# Links

- <https://zookeeper.apache.org/doc/trunk/zookeeperAdmin.html>
- <https://zookeeper.apache.org/doc/trunk/zookeeperAdmin.html#The+Four+Letter+Words>
