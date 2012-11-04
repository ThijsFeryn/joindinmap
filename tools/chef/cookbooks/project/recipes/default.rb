execute "add-hosts-file-entry" do
  command "echo '#{node[:project][:ip]} #{node[:project][:hostname]}' >> /etc/hosts"
  action :run
  ignore_failure false
end
require_recipe "apt"
require_recipe "vim"
require_recipe "php"
require_recipe "php::module_apc"
require_recipe "php::module_curl"
require_recipe "php::module_mysql"
require_recipe "php-fpm"
require_recipe "nginx"
template "#{node[:nginx][:dir]}/sites-enabled/#{node[:project][:hostname]}" do
  source "site.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, "service[nginx]"
end
require_recipe "mysql::client"
