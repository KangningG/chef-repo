# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "admin-user"
client_key               "#{current_dir}/admin-user.pem"
validation_client_name   'fin_org'
validation_key           "#{current_dir}/Fin-validator.pem"
chef_server_url          "https://ip-172-31-30-8.ec2.internal/organizations/fin_org"
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
