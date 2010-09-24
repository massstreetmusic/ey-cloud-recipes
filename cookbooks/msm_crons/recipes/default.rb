#
# Cookbook Name:: msm_crons
# Recipe:: default
#
puts node[:instance_role]
puts node[:instance_role]
puts node[:instance_role]
node[:applications].each do |app_name,data|
  {'gbase-csv-generate'=>[5,0], 'lownotes-csv-generate'=>[5,1]}.each do |job, hour_minute|
    cron "gbase-csv-generate" do
      action  :create
      hour hour_minute.first
      minute hour_minute.last
      day      '*'
      month    '*'
      weekday  '*'
      command "cd /data/#{app_name}/current && script/runner -e #{node[:environment]} cron/#{job}.rb"

      user node[:owner_name]
    end  
    
  end
end
