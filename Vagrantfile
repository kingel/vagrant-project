Vagrant::Config.run do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.ssh.max_tries = 50
    config.ssh.timeout   = 300
    config.vm.share_folder("workspace", "/mnt/workspace", ".")
    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "data/puppet/manifests"
        puppet.module_path = "data/puppet/modules"
        puppet.manifest_file = "virtualbox.pp"
    end
end