<h3>HAPROXY Load Balancer setup</h3>

Creating HA-Proxy load balancer setup with roundrobin support.

<h4>Getting Started</h4>

These instructions will get you setup haproxy load balancer on your local machine with help of vagrant and virtualbox. Here i used one haproxy server and two nginx web server
haproxy : 10.11.11.100
nginx web1 : 10.11.11.101
nginx web2 : 10.11.11.102

<h4>Prerequisites</h4>

You must have administrator privileges to install the below softwares, select the package based on your operating system 

Vagrant 2.2.4 - https://www.vagrantup.com/downloads.html
VirtulBox 5.2 - https://www.virtualbox.org/wiki/Download_Old_Builds_5_2

You need to restart after installing the virtualbox and vagrant

OS : Linux or Windows

<h4>Installing</h4>

create one folder, here i created haproxylab in /opt in my linux box

Download the Vagrantfile and additional script files

https://github.com/gmkmanoj/vagrant-haproxy-lb-setup/blob/master/haproxy-lb-setup.zip

Extract the zip file into newly created folder

Now time to bring up instance using vagrant

<h6>In Windows:</h6>

Go to powershell

go to the haproxy-lb-setup.zip file extracted path do ls to verify the files

PS C:\Users\manoj\haproxylab> ls

PS C:\Users\manoj\haproxylab> vagrant up

<h6>In Linux :</h6>

Open terminal and go the extract folder
Ex : 
# cd /opt/haproxylab
haproxylab]# ls
installhaproxy.sh  installnginx.sh  README.md  Vagrantfile  web1content.sh  web2content.sh

And run vagrant up

haproxylab]# vagrant up

Now the vagrant will download centos/7 box and create three virtualbox vm named like below and it will complete the haproxy and nginx setup.

HAProxy
NginxWeb1
NginxWeb2

After the completion of the above command please verify the vm status

haproxylab]# vagrant status

Current machine states:

halb                      running (virtualbox)
web1                      running (virtualbox)
web2                      running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.

Yes the three instances are up now.

Now hit the haproxy URL http://10.11.11.100 now we will get response from one of the nginx server, do refresh and check the response from nginx server 2.

haproxylab]# curl http://10.11.11.100/
<html>
<body>
<h1>Hello World</h1>
    <p>Response from : <h3>Nginx web1</h3></p>
</body>
</html>
haproxylab]# curl http://10.11.11.100/
<html>
<body>
<h1>Hello World</h1>
    <p>Response from : <h3>Nginx web2</h3></p>
</body>
</html>

Now the Haproxy Load balancer setup completed and running in roundrobbin method.

You can ssh the instance and stop one of the nginx web service to verify the haproxy getting response from other server.

