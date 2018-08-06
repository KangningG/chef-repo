# Author:: Fin Gao
# Node:: client-1

name "client-1"
# default['java']['jdk_version'] = '8'
# default['java']['install_flavor'] = 'oracle'
# run_list "recipe[maven::junit]","recipe[maven::tomcat]","role[IDETools]"
run_list "role[IDETools]","recipe[tomcat::tomcat_inst]"
# override_attributes({
#   "owner_name" => "fin gao",
# })
# default_attributes({"java" => { "jdk_version" => "8"}})