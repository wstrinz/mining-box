vagr = '/home/vagrant'

execute "update source" do
  command "sudo apt-get update"
end

%w{screen curl yasm git make g++ build-essential libminiupnpc-dev  libdb++-dev libgmp-dev libssl-dev dos2unix}.each do |pkg|
  package pkg do
    action :install
  end
end


execute "dependancy checkpoint 1" do
  command "echo hello"
end

%w{libboost-all-dev libboost-chrono1.48-dev libboost-filesystem1.48-dev libboost-program-options1.48-dev libboost-thread1.48-dev}.each do |p|
  package p do
    action:install
  end
end

directory "#{vagr}/miners" do
  owner "vagrant"
  mode "0755"
  action :create
end

execute "clone primecoin" do
  cwd "#{vagr}/miners"
  command "git clone https://github.com/thbaumbach/primecoin"
  not_if { ::File.exists?("#{vagr}/miners/primecoin")}
end

execute "build from source" do
  cwd "#{vagr}/miners/primecoin/src"
  command "make -f makefile.unix"
end
