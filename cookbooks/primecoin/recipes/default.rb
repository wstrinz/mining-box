%w{git make g++ build-essential libminiupnpc-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

package "curl" do
  action :install
end

directory "miners" do
  owner "vagrant"
  mode "0755"
  action :create
end
