# Author:: Fin Gao
# Node:: client-3

name "client-3"
# run_list "recipe[maven::junit]","recipe[maven::tomcat]","role[IDETools]"
run_list "role[IDETools]","recipe[tomcat::tomcat_inst]"