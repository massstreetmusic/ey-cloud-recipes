#
# Cookbook Name:: link_images
# Recipe:: default
#

%w{newsletters images/catalog blurbs ebay}.each{ |directory|  
  link "/data/#{app_name}/current/public/#{directory}" do
    to "/data/#{app_name}/shared/public/#{directory}"
  end
}
