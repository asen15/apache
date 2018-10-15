package 'httpd' do
 action :install
end

cookbook_file '/var/www/html/test.html' do
 source 'test.html'
 action :create
end

remote_file '/var/www/html/flower.png' do
 source 'https://www.gstatic.com/webp/gallery3/1.png'
end

template '/var/www/html/index.html' do
 source 'index.html.erb'
 variables(
  :name => "1st Working Server"
 )
 action :create
end

service 'httpd' do
 action [ :enable, :start ]
end

