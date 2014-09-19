#!/bin/sh

ip=`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
command="/home/ubuntu/apache-jmeter-2.10/bin/jmeter-server -Djava.rmi.server.hostname=$ip"
echo $command
`$command`
