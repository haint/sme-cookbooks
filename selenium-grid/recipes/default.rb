#
# Cookbook Name:: jenkins-slave
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# download file from url

remote_file "/home/ubuntu/selenium-server-standalone-2.41.0.jar" do
  source "http://172.27.4.48/cache/selenium-server-standalone-2.41.0.jar"
  mode "0644"
end


# Install selenium grid node
execute "install-selenium" do
  cwd "/home/ubuntu"
  command <<-EOF
    /home/ubuntu/java/jdk1.7.0_51/bin/java -jar selenium-server-standalone-2.41.0.jar  -role node -hub http://git.sme.org:4444/grid/register > log.txt &
    EOF
end

remote_file "/home/ubuntu/chromedriver" do
  source "http://172.27.4.48/cache/chromedriver"
  mode "0644"
end

execute "chmod for chromedriver" do
  cwd "/home/ubuntu"
  command <<-EOF
    chmod 777 chromedriver
    EOF
end
