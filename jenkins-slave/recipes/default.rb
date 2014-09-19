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
end

remote_file "/home/ubuntu/jenkins-slave-nongui.sh" do
	source "http://172.27.4.48/cache/jenkins-slave-nongui.sh"
end

# Install sms_jenkins_tools
execute "install-jar" do
  cwd "/home/ubuntu"
  command <<-EOF
    ./jenkins-slave-nongui.sh > log.txt &
    EOF
end

