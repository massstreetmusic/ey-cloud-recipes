#
# Cookbook Name:: link_images
# Recipe:: default
#

node[:applications].each do |app_name,data|
  link "/data/#{app_name}/current/public/newsletters" do
    to "/data/#{app_name}/shared/public/newsletters"
  end
  
  %w{catalog blurbs ebay}.each{ |directory|  
    link "/data/#{app_name}/current/public/images/#{directory}" do
      to "/data/#{app_name}/shared/#{directory}"
    end
  }

end
