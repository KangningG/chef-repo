#
# Cookbook:: maven
# Recipe:: junit

include_recipe 'maven::default'
 maven 'junit' do
  group_id   'junit'
  artifact_id 'junit'
  version    '4.9'
  dest       '/usr/local/dependencies'
  action     :put
end