# Author:: Fin Gao
# Node:: tutorial

name "tutorial"
run_list "recipe[maven::junit]","recipe[maven::tomcat]","role[IDETools]"
