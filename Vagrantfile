
Vagrant.configure("2") do |config|
		
  # HAProxy LB configuration   
  
  config.vm.define "halb" do |halb|
	halb.vm.box = "centos/7"
	halb.vm.hostname = "ha-lb-001"
	halb.vm.network "private_network", ip: "10.11.11.100", netmask: "255.255.255.0" 
		halb.vm.provider :virtualbox do |vb|
			vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", 1, "--name", "HAProxy"]	
		end
	halb.vm.provision :shell, :path => "installhaproxy.sh", privileged: "true"
  end	
  
  # Nginx Web server 1 configuration 
  
  config.vm.define "web1" do |web1|
	web1.vm.box = "centos/7"
	web1.vm.hostname = "nginx-web-001"
	web1.vm.network "private_network", ip: "10.11.11.101", netmask: "255.255.255.0"
		web1.vm.provider :virtualbox do |vb|
			vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", 1, "--name", "NginxWeb1" ]	
		end
	web1.vm.provision :shell, :path => "installnginx.sh", privileged: "true"
	web1.vm.provision :shell, :path => "web1content.sh", privileged: "true"
  end	
  
  # Nginx Web server 2 configuration 
  
  config.vm.define "web2" do |web2|
	web2.vm.box = "centos/7"
	web2.vm.hostname = "nginx-web-002"
	web2.vm.network "private_network", ip: "10.11.11.102", netmask: "255.255.255.0"
		web2.vm.provider :virtualbox do |vb|
			vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", 1, "--name", "NginxWeb2"]	
		end
	web2.vm.provision :shell, :path => "installnginx.sh", privileged: "true"
	web2.vm.provision :shell, :path => "web2content.sh", privileged: "true"
  end	
end
