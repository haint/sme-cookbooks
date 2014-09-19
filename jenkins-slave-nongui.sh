#!/bin/sh

ip=`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
command="/home/ubuntu/java/jdk1.7.0_51/bin/java -jar sme_jenkins_tools.jar -m $ip -c"
echo $command
`$command`
