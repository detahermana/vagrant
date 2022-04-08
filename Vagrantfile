Vagrant.configure("2") do |config|


  config.vm.define "lp" do |lp|
    lp.vm.hostname = "lp"
    lp.vm.provision :shell, path: "lp.sh"
    lp.vm.box = "ubuntu/focal64"
    lp.vm.network "private_network",ip: "192.168.56.3"
      lp.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
      end
    end


config.vm.define "wordpress" do |wordpress|
    wordpress.vm.hostname = "wordpress"
    wordpress.vm.provision :shell, path: "wp.sh"
    wordpress.vm.box = "ubuntu/focal64"
    wordpress.vm.network "private_network",ip: "192.168.56.4"
      wordpress.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
      end
    end


config.vm.define "pesbuk" do |pesbuk|
    pesbuk.vm.hostname = "pesbuk"
    pesbuk.vm.provision :shell, path: "pesbuk.sh"
    pesbuk.vm.box = "ubuntu/focal64"
    pesbuk.vm.network "private_network",ip: "192.168.56.5"
      pesbuk.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
      end
    end
end
