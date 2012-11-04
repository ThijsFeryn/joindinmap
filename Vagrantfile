# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
  config.vm.customize [
        "modifyvm", :id,
        "--name", "joindin.feryn.dev",
        "--memory", "256"
  ]
  config.vm.network :hostonly, "12.12.12.111"
  config.vm.share_folder "v-data", "/home/data", "./"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./tools/chef/cookbooks"
    chef.json = {
      :project => {
            :ip => "12.12.12.111",
            :approot => "/home/data",
            :webroot => "/home/data/public"
        }
      }
    chef.add_recipe("project")
  end
end
