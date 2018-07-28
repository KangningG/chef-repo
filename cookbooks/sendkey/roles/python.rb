name "python"
description "An example Chef role"
run_list "recipe[python::default]"
override_attributes({
  "owner_name" => "fin gao",
})
