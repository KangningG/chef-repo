name "IDETools"
description "An example Chef role"
run_list "recipe[python::default]","recipe[java]","recipe[maven::default]"
override_attributes({
  "owner_name" => "fin gao",
})
default_attributes(
	{
		"java" => { 
			"jdk_version" => "8",
			"install_flavor"=> "oracle",
			"oracle" => {
				"accept_oracle_download_terms"=> true
			}	
	}
})