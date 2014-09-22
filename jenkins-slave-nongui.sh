#!/bin/sh

ip=`cat ~/jenkins.master`
command="/home/ubuntu/java/jdk1.7.0_51/bin/java -jar sme_jenkins_tools.jar -m $ip -c"
echo $command
`$command`
