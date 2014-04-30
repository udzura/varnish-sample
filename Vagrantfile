# -*- mode: ruby; coding: utf-8 -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "SL-6.1-x86_64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "varnish-sample.dev"
  config.vm.synced_folder "./varnish_cached_app", "/var/www/varnish_cached_app"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "site-modules"
    puppet.manifest_file = "site.pp"

    if ENV["DEBUG"]
      puppet.options = "--verbose --debug --show_diff"
    else
      puppet.options = "--show_diff"
    end
  end
end
