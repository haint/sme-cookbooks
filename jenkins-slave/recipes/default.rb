#
# Cookbook Name:: jenkins-slave
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# download file from url

remote_file "/home/ubuntu/sme_jenkins_tools.jar" do
  source "http://172.27.4.48/iso/sme-jenkins-tools.jar"
  mode "0644"
#  not_if { ::File.exists?(java_file) }
end

#include_recipe "java::set_attributes_from_version"
#include_recipe "java::#{node['java']['install_flavor']}"

# Install sms_jenkins_tools
execute "install-jar" do
  cwd "/home/ubuntu"
  command <<-EOF
    /home/ubuntu/java/jdk1.7.0_51/bin/java -jar sme_jenkins_tools.jar -m 172.27.4.77 -c
    # command for installing Python goes here	
    EOF
#  not_if { ::File.exists?(java_file) }
end

