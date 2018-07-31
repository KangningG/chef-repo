#
# Cookbook:: maven
# Recipe:: default
#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Author:: Bryan W. Berry (<bryan.berry@gmail.com>)
#
# Copyright:: 2010-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'ark::default'

group 'create the group for Maven' do
  group_name node['maven']['group']
  not_if { node['maven']['group'] == 'root' || node['maven']['group'] == 'Administrators' }
end

user 'create the user for Maven' do
  username node['maven']['user']
  group node['maven']['group']
  manage_home true
  not_if { node['maven']['user'] == 'root' || node['maven']['user'] == 'Administrator' }
end

# install maven via ark
ark 'maven' do
  version node['maven']['3.5.0']
  url node['maven']['url']
  checksum node['maven']['checksum']
  home_dir node['maven']['m2_home']
  win_install_dir node['maven']['m2_home']
  append_env_path node['maven']['setup_bin']
  owner node['maven']['user']
  group node['maven']['group']
end

# setup environmental variables
if node['platform_family'] == 'windows'
  env 'M2_HOME' do
    value node['maven']['m2_home']
    action :create
  end
  env 'MAVEN_OPTS' do
    value node['maven']['mavenrc']['opts']
    action :create
  end
else
  template '/etc/mavenrc' do
    source 'mavenrc.erb'
    mode   '0755'
  end
end