[SmartStack is an automated service discovery and registration framework](http://nerds.airbnb.com/smartstack-service-discovery-cloud/).

# Components
- Synapse: Announces state of local services
- Nerve: Query zookeeper for healthy services to connect to, then configures HAProxy
- Zookeper: Service registry
- HAProxy: Load balancing

# Links
- [DockerCon 14: Tomas Doran - Building a smarter application stack](https://www.youtube.com/watch?v=49_5lwGtkmo)
- [Smartstack ( HAProxy + Serf ) Automated service discovery without rewriting apps](https://www.youtube.com/watch?v=WxbrrPUVGFc)
