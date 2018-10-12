package 'httpd' do
 action :install
end

file '/var/www/html/index.html' do
 content "<html><body>
 <h1>Welcome To My World !!!</h1><br>
 <table>
 <tr><td>HOSTNAME</td><td>#{node['hostname']}</td></tr>
 <tr><td>IPADDRESS</td><td>#{node['ipaddress']}</td></tr>
 <tr><td>CPU</td><td>#{node['cpu']['0']['mhz']}</td></tr>
 <tr><td>Memory</td><td>#{node['memory']['total']}</td></tr>
 </table>
 </body></html>"
 action :create
 owner 'root'
 group 'root'
end

service 'httpd' do
 action [ :enable, :start ]
end

