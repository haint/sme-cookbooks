#
# Cookbook Name:: jenkins-slave
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# download file from url

remote_file "/home/ubuntu/apache-jmeter-2.10.tgz" do
  source "http://172.27.4.48/cache/apache-jmeter-2.10.tgz"
  mode "0644"
end

remote_file "/home/ubuntu/jmeter-run.sh" do
  source "http://172.27.4.48/cache/jmeter-run.sh"
  mode "0777"
end

# extract jmeter server
    #tar -xvf apache-jmeter-2.10.tgz && cd apache-jmeter-2.10 && ./bin/jmeter-server -Djava.rmi.server.hostname=0.0.0.0 > log.txt &
execute "extract-jmeter" do
  cwd "/home/ubuntu"
  command <<-EOF
    tar -xvf apache-jmeter-2.10.tgz
    EOF
end

execute "run jmeter-server" do
  cwd "/home/ubuntu"
  command <<-EOF
    ./jmeter-run.sh > jmeter-log.txt &
    EOF
end
