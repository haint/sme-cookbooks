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

remote_file "/home/ubuntu/jenkins-slave-gui.sh" do
	source "http://172.27.4.48/cache/jenkins-slave-gui.sh"
	mode "0777"
end

remote_file "/home/ubuntu/chromedriver" do
	source "http://172.27.4.48/cache/chromedriver"
	mode "0777"
end

# Install sms_jenkins_tools
execute "install-jar" do
  cwd "/home/ubuntu"
  command <<-EOF
    ./jenkins-slave-gui.sh > jenkins-gui-log.txt &
    EOF
end

