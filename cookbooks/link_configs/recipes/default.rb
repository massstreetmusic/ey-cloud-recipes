#
# Cookbook Name:: link_configs
# Recipe:: default
#

node[:applications].each do |app_name,data|
  # link "/data/#{app_name}/current/config/amazon_s3.yml" do
  #   to "/data/#{app_name}/shared/config/amazon_s3.yml"
  # end
  execute "ln -nfs /data/#{app_name}/shared/config/memcached.yml /data/#{app_name}/current/config/memcached.yml"
  execute "ln -nfs /data/#{app_name}/shared/config/amazon_s3.yml /data/#{app_name}/current/config/amazon_s3.yml"
  
end
