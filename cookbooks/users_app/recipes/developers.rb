#
# Cookbook Name:: users_sestra
# Recipe:: developers
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w( dev ).each do |group|
  users_manage group do
    action [ :remove, :create ]
  end
end

# Passwordless sudo for 'dev' group members
cookbook_file "/etc/sudoers.d/dev" do
	source "dev.conf"
	mode 0440
	owner "root"
	group "root"
end
