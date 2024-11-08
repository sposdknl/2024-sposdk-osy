IMAGE_NAME = "bento/rockylinux-9"

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox " do |v|
        v.allowlist_verified = true
        v.memory = 1024
        v.cpus = 1
    end

    config.vm.define "rocky" do |rocky|
        rocky.vm.box = IMAGE_NAME
        rocky.vm.network "forwarded_port", guest: 22, host: 2203, host_ip: "127.0.0.1"
        rocky.vm.network "private_network", ip: "192.168.24.1"
        rocky.vm.hostname = "rockylinux"
    end

    config.vm.provision "file", source: "id_rsa.pub", destination: "~/.ssh/me.pub"
    config.vm.provision "shell", inline: <<-SHELL
    cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys

    SHELL

    # Načtení a provedení scriptu install-zabbix-agent2.sh
    config.vm.provision "shell", path: "install-zabbix-agent2.sh"

    # Načtení a provedení scriptu configure-zabbix-agent2.sh
    config.vm.provision "shell", path: "configure-zabbix-agent2.sh"

end