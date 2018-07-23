name "starter_2.0"
description "An example Chef role"
run_list "recipe[starter]"
override_attributes({
  "starter_name" => "fin gao 2.0",
})
