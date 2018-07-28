#
# Cookbook:: sendkey
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# include_recipe "sendkey::publicgroup"

users_manage "rebels" do
   group_id 1138
   action [ :remove, :create ]
 end