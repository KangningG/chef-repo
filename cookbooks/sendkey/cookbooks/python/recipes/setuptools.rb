# Author:: Fin Gao
# Cookbook Name:: python
# Recipe:: setuptools

bash 'setuptools' do
	cwd '/tmp'
	code <<-EOH
	sudo yum upgrade python-setuptools
	EOH
end