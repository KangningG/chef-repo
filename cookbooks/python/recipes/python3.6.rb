# Author:: Fin Gao
# Cookbook Name:: python
# Recipe:: python3.6

bash 'python3.6' do
	cwd '/tmp'
	code <<-EOH
	sudo yum install python
	EOH
end
