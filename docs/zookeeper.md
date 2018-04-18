Title: zookeeper

ZooKeeper is a high-performance coordination service for distributed applications. - <https://zookeeper.apache.org/doc/trunk/>

# Examples

## The four letter words

"ZooKeeper responds to a small set of commands. Each command is composed of four letters. You issue the commands to ZooKeeper via telnet or nc, at the client port." - <https://zookeeper.apache.org/doc/r3.4.8/zookeeperAdmin.html#sc_zkCommands>

## Lists brief details for the server and connected clients

`echo 'stat' | nc localhost 2181`

## View a list of variables that could be used for monitoring the health of the cluster

`echo 'mntr' | nc localhost 2181`

## List full details for the server

`echo 'srvr' | nc localhost 2181`

# Links

- <https://zookeeper.apache.org/doc/r3.4.8/zookeeperAdmin.html>
