#
# Cookbook Name:: crontab_mailto
# Recipe:: default
#
execute "cron-MAILTO" do
  command "(echo 'MAILTO=msm@hordesoftware.com'; crontab -u #{node[:owner_name]} -l) | uniq | crontab -u #{node[:owner_name]} -"
end