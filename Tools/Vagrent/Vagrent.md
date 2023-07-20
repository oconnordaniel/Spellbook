
``` bash 
cd \Folder\for\this\VMorProgect
vagtent init
```

`.\Vagrantfile

``` ruby

Vagrant.configure("2") do |config|
    config.vm.box = "base" # Image base
    
    config.vm.network "public_network"
    
    config.vm.provider "provider"
    config.vm.provider "provider" do |provider_var|
    
    
    config.vm.provider :libvirt do |libvirt|
        libvirt.cpus = 1
        libvirt.memory = 1024
    end
end

```

``` bash
vagrant up
```
