# Author:: Fin Gao
# Node:: tutorial

name "tutorial"
run_list "role[python]"
include_recipe "sendkey::publicgroup"
