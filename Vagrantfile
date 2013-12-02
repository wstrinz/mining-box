nCPUs = 4
Vagrant.configure('2') do |config|
  config.vm.box      = 'precise32'          
  config.vm.box_url  = 'http://files.vagrantup.com/precise32.box'
  config.vm.hostname = 'coin-miner-box'

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--cpus", nCPUs]
    v.customize ["modifyvm", :id, "--ioapic", 'on']

    # This setting makes it so that network access from inside the vagrant guest
    # is able to resolve DNS using the hosts VPN connection.
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "primecoin"
  end

  #config.vm.provision :shell, :inline => "echo \"cd /home/vagrant/miners/primecoin/src && screen -S test -d -m ./primeminer -poolip=54.200.248.75 -poolport=1337 -pooluser=AdgLUAL6hK3kcZ2vftygzMj5Xwjeor5f17 -poolpassword=PASSWORD -genproclimit=1\" >> start.sh && chmod +x start.sh && su vagrant && ./start.sh"

end
