# Author:: Fin Gao
# Cookbook Name:: python
# Recipe:: pip

bash 'pip' do
	cwd '/tmp'
	code <<-EOH
	sudo yum install -y python3-pip
	EOH
end
