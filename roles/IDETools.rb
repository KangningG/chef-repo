name "IDETools"
description "An example Chef role"
run_list "recipe[python::default]","recipe[maven::default]","recipe[oracle_java::default]"
override_attributes({
  "owner_name" => "fin gao",
})