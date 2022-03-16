Vagrant.configure("2") do |config|
    config.vm.box = "hashicorp/bionic64"

        config.vm.define "kube_master" do |k8sm|
            k8sm.vm.hostname = "kube-master"
            k8sm.vm.network "public_network", ip: "192.168.0.100"
            #k8sm.vm.provision "first", before: :all, type: "shell", path: "script-master.sh"
            #k8sm.vm.provision "second", after: "first", type: "shell", path: "script-master-final.sh"
            k8sm.vm.provision "shell", path: "script-master.sh"
            config.vm.provider "virtualbox" do |vbm|
                        vbm.memory = 4096
                        vbm.cpus = 2
            end
        end
    (1..2).each do |i|                                        
        config.vm.define "kube_worker#{i}" do |k8sw|
            k8sw.vm.hostname = "kube-worker#{i}"
            k8sw.vm.network "public_network", ip: "192.168.0.10#{i}"
            k8sw.vm.provision "shell", path: "script-worker.sh"
            config.vm.provider "virtualbox" do |vbw|
                        vbw.memory = 2048
                        vbw.cpus = 1
            end                    
        end
    end
end    