#
# Cookbook Name:: msm_crons
# Recipe:: default

if ['solo', 'app', 'app_master'].include?(node[:instance_role])
  node[:applications].each do |app_name,data|
    {'gbase-csv-generate'=>[5,0], 
      'lownotes-csv-generate'=>[5,1], 
      'oodle-csv-generate'=>[5,3]}.each do |job, hour_minute|
      cron job do
        action  :create
        hour hour_minute.first
        minute hour_minute.last
        day      '*'
        month    '*'
        weekday  '*'
        command "cd /data/#{app_name}/current && script/runner -e #{node[:environment][:framework_env]} cron/#{job}.rb"

        user node[:owner_name]
      end  
    end

    cron 'Generate GoogleBase File' do
      action  :create
      hour     '*'
      minute   '5'
      day      '*'
      month    '*'
      weekday  '*'
      command "cd /data/#{app_name}/current && script/runner -e #{node[:environment][:framework_env]} GoogleBaseFile.write"

      user node[:owner_name]
    end  

    cron 'mygear-csv-generate' do
      action  :create
      hour     '5'
      minute   '10'
      day      '*'
      month    '*'
      weekday  '*'
      command "cd /data/#{app_name}/current && ruby cron/mygear-csv-generate.rb #{node[:environment][:framework_env]}"
    end  
  end
end