#
# Cookbook Name:: link_configs
# Recipe:: default
#

node[:applications].each do |app_name,data|
  # link "/data/#{app_name}/current/config/amazon_s3.yml" do
  #   to "/data/#{app_name}/shared/config/amazon_s3.yml"
  # end
  run "ln -nfs #{shared_path}/config/memcached_custom.yml #{release_path}/config/memcached.yml"
  run "ln -nfs #{shared_path}/config/amazon_s3.yml #{release_path}/config/amazon_s3.yml"
  
end
