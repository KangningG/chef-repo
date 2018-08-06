# Cookbook Name:: tomcat
# Recipe:: tomcat_inst

bash 'tomcat_inst' do
	cwd '/tmp'
	code <<-EOH
	sudo yum install -y tomcat
	EOH
end

