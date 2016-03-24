# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.name = "target"
  config.vm.box = "hashicorp/precise32"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get -y update
    sudo apt-get install -y git
    sudo apt-get install -y vim-nox
    sudo apt-get install -y elinks
    sudo apt-get install -y openjdk-7-jdk
    sudo apt-get install -y tomcat7
    sudo service tomcat7 restart
  SHELL
end
