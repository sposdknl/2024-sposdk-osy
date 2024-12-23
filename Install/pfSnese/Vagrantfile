IMAGE_NAME = "cs-c4300/pfsense"

Vagrant.configure("2") do |config|
  config.vm.guest = :freebsd
  config.vm.box = IMAGE_NAME
  config.ssh.shell = "sh"
  config.ssh.insert_key = false 
  config.vm.synced_folder '.', '/vagrant', disabled: true
  # to access pfSense on https://localhost:8888
  config.vm.network :forwarded_port, guest: 443, host: 8888, host_ip: "127.0.0.1"

  # External network WAN
  config.vm.network "private_network",
  auto_config: false,
  type: "dhcp", netmask: "255.255.0.0", dhcp_ip:"10.1.1.1", dhcp_lower: "10.1.1.100", :dhcp_upper=>"10.1.1.200"

  # Internal LAN config
  config.vm.network "private_network", 
  auto_config: false,
  virtualbox__intnet: "intnet"

  config.vm.provider "virtualbox" do |vb|
      vb.name = "pfsense-box"
  end

end