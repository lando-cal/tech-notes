Title: solo

solo is a command that uses a per-user loopback IP# and a designated port to ensure that multiple copies of a command are not run. This takes the place of pid files and process tracking, and has the benefit of never leaving around a false positive. It also lets you skip building trap, pid file and process checking into every shell script you write.

<http://timkay.com/solo>
