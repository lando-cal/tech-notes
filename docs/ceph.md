# Ceph

"Ceph is a unified, distributed storage system designed for excellent performance, reliability and scalability." - <https://ceph.com>

# Glossary

<http://docs.ceph.com/docs/master/glossary/>

- Ceph OSD: The Ceph OSD software, which interacts with a logical disk (OSD).
- CephFS: The POSIX filesystem components of Ceph.
- MDS: (Ceph Metadata Server) The Ceph metadata software.
- MGR: (Ceph Manager) The Ceph manager software, which collects all the state from the whole cluster in one place.
- MON: (Ceph Monitor) The Ceph monitor software.
- OSD: (Object Storage Device) A physical or logical storage unit.
- RADOS: Reliable Autonomic Distributed Object Store.
- RBD: The block storage component of Ceph.
- RGW: The S3/Swift gateway component of Ceph.

# Examples

`sudo ceph-disk activate-all`

# Links

- Ceph Intro & Architectural Overview - <https://youtu.be/7I9uxoEhUdY>
- <http://docs.ceph.com/docs/master/start/quick-ceph-deploy/>
- <http://docs.ceph.com/ceph-ansible/master/>
