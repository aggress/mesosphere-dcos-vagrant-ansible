# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = [
    {
        :name => "bootstrap",
        :eth1 => "192.168.33.10",
        :mem => "1024",
        :cpu => "1"
    },
    {
        :name => "master",
        :eth1 => "192.168.33.11",
        :mem => "1024",
        :cpu => "2"
    },
    {
        :name => "private-agent",
        :eth1 => "192.168.33.12",
        :mem => "8192",
        :cpu => "4"
    },
       {
        :name => "public-agent",
        :eth1 => "192.168.33.13",
        :mem => "1536",
        :cpu => "2"
    },
]

Vagrant.configure(2) do |config|
  config.vm.box = "centos7_updated"
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
      config.vm.network :private_network, ip: opts[:eth1]
      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
        # suggested speedup for network performance through faster name resolution
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        # suggested speedup by enabing multiple cpu cores, figured it would be by default
        v.customize ["modifyvm", :id, "--ioapic", "on"]
      end
    end
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
