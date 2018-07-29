# Author:: Fin Gao
# Node:: tutorial

name "tutorial"
run_list "role[python],recipe[users_app::developers]"
