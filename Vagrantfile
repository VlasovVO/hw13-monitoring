# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = true

  config.vm.define "host", primary: true do |s|
    s.vm.hostname = 'host'
    s.vm.network "private_network", ip: "192.168.111.10"
    s.vm.provision "shell", inline: <<-SHELL
      # install docker
      yum install -y yum-utils device-mapper-persistent-data lvm2
      yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
      yum install -y docker-ce
      usermod -aG docker vagrant
      systemctl enable docker.service
      systemctl start docker.service
      # unstall docker compose
      yum install -y epel-release
      yum install -y python-pip
      pip install docker-compose
      yum upgrade -y python*
      cp /vagrant/docker-compose.yml /home/vagrant/docker-compose.yml
      cp /vagrant/prometheus.yml /home/vagrant/prometheus.yml
      cp /vagrant/dockerfile /home/vagrant/dockerfile
      cd /home/vagrant/ 
      docker build -f dockerfile -t hw/prometheus .
      docker-compose -f /home/vagrant/docker-compose.yml up -d
    SHELL
  end
end
