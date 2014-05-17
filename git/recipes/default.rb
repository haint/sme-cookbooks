#
# Cookbook Name:: jenkins-slave
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# download file from url

#include_recipe "java::#{node['java']['install_flavor']}"

# Install sms_jenkins_tools
execute "install-git" do
  command <<-EOF
    apt-get install git -y
    # command for installing Python goes here	
    EOF
#  not_if { ::File.exists?(java_file) }
end

