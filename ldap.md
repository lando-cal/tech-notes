# Refresh LDAP user cache on CentOS 6

    nscd -i passwd ; nscd -i group ; /etc/init.d/lldpad restart ; /etc/init.d/nslcd restart ; /etc/init.d/nscd restart ;
