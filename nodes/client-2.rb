# Author:: Fin Gao
# Node:: client-2

name "client-2"
# run_list "recipe[maven::junit]","recipe[maven::tomcat]","role[IDETools]"
run_list "role[IDETools]","recipe[tomcat::tomcat_inst]"