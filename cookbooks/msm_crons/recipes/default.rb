#
# Cookbook Name:: msm_crons
# Recipe:: default
#
puts node[:instance_role]
puts node[:instance_role]
puts node[:instance_role]
node[:applications].each do |app_name,data|
  cron "gbase-csv-generate" do
    action  :create
    hour "5"
    minute "0"
    day      '*'
    month    '*'
    weekday  '*'
    command "cd /data/#{app_name}/current && script/runner -e #{node[:environment]} cron/check-for-missing-pages.rb"

    user node[:owner_name]
  end  
end
