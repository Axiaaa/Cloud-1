Vagrant.configure("2") do |config|
    config.vm.box = "debian/bookworm64"
    
    
    config.vm.define "lcamerlyS" do |master|
      master.vm.hostname = "lcamerlyS"
      master.vm.network "private_network", ip: "192.168.56.110"
      master.vm.network "forwarded_port", guest: 443, host: 9443
      master.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
      end
    end

    config.vm.define "lcamerlyS2" do |master|
      master.vm.hostname = "lcamerlyS2"
      master.vm.provider "virtualbox" do |vb|
      master.vm.network "private_network", ip: "192.168.56.111"
      master.vm.network "forwarded_port", guest: 443, host: 8443
        vb.memory = "2048"
        vb.cpus = 2
      end
    end


  end