Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.ssh.max_tries = 50
  config.ssh.timeout   = 300
  config.vm.share_folder "workspace", "/home/vagrant/workspace", "workspace"
  config.vm.define :puppet do |puppet_config|
    puppet_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.module_path = "modules"
        puppet.manifest_file = "virtualbox.pp"
    end
  end
end
