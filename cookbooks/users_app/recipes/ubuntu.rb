#
# Cookbook Name:: users_sestra
# Recipe:: ubuntu
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w( ubuntu sudo ).each do |group|
  users_manage group do
    action [ :remove, :create ]
  end
end

# Passwordless sudo for 'sudo' group members
cookbook_file "/etc/sudoers.d/90-cloud-init-users" do
	source "90-cloud-init-sudo-group"
	mode 0440
	owner "root"
	group "root"
end
