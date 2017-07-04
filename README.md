# mesosphere-dcos-vagrant-ansible

A lightweight Vagrant+Ansible deployment for Mesosphere DC/OS on a laptop

* Creates a local Vagrant cluster of 3 nodes {bootstrap,master,private agent}
* Uses Ansible to install DC/OS using the recommended Advanced Installer method

https://docs.mesosphere.com/latest/installing/custom/advanced/

## Pre-requisites

### On macOS

1.
   ```
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   brew cask install virtualbox
   brew cask install vagrant
   brew install ansible
   vagrant plugin install vagrant-hostsupdater
   vagrant plugin install vagrant-vbguest
   ```

2. Clone this repository locally into a folder where you'll execute it from

   `git clone git@gitub.com:aggress/mesosphere-dcos-vagrant-ansible`

3. Download the DC/OS installation file (~800MB) to the project directory.  Mesosphere can provide you the DC/OS Enterprise URL or you can grab the OSS installer `curl -O https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh`

4. Optional - you can save time by using a base box that's already had the majority of OS updates applied, and the latest virtualbox guest additions added, notes here - https://aggress.github.io/vagrant-custom-box
   
## Usage

* `cd mesosphere-dcos-vagrant-ansible`
* Run `vagrant up` to launch and provision, takes ~12 minutes.
* When complete, access the master UI from http://192.168.33.11
* To destroy, run `vagrant destroy -f`

## Notes

* Built for DC/OS Enterprise (dcos_generate_config.ee.sh) but can easily be amended for DC/OS OSS
* You can kill the bootstrap node after the install's completed to free up the resources

## Limitations

* Only tested on CentOS 7
* Only tested with DC/OS 1.9
* IPs hard coded
