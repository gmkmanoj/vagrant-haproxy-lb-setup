<h3>HAPROXY Load Balancer setup</h3>

Creating HA-Proxy load balanced web server environment setup with roundrobin support.

<h4>Getting Started</h4>

These instructions will get you to setup the haproxy load balancer on your local machine with help of vagrant and virtualbox. Here i used one haproxy server and two nginx web server

haproxy : 10.11.11.100<br>
nginx web1 : 10.11.11.101<br>
nginx web2 : 10.11.11.102<br>

<h4>Prerequisites:</h4>

You must have internet connection and administrator privileges to install the below softwares, select the package based on your operating system

Vagrant 2.2.4 - https://www.vagrantup.com/downloads.html<br>
VirtulBox 5.2 - https://www.virtualbox.org/wiki/Download_Old_Builds_5_2<br>

You need to restart the machine after installing the virtualbox and vagrant

OS : Linux or Windows

<h4>Installation:</h4>

create one folder, here i created haproxylab in /opt in my linux box

Download the Vagrantfile and additional script files

https://github.com/gmkmanoj/vagrant-haproxy-lb-setup/blob/master/haproxy-lb-setup.zip

Extract the zip file into newly created folder

Now time to bring up instance using vagrant

<h5>In Windows:</h5>

Go to powershell

go to the haproxy-lb-setup.zip file extracted path do ls to verify the files

PS C:\Users\manoj\haproxylab> ls

And run vagrant up 

PS C:\Users\manoj\haproxylab> vagrant up

<h5>In Linux :</h5>

Open terminal and go the extract folder location

cd /opt/haproxylab
haproxylab]# ls
<br>
installhaproxy.sh  installnginx.sh  README.md  Vagrantfile  web1content.sh  web2content.sh

And run vagrant up

haproxylab]# vagrant up

Now the vagrant will download centos/7 box and create three virtualbox vm named like below and it will complete the haproxy and nginx setup.

HAProxy<br>
NginxWeb1<br>
NginxWeb2<br>

After the completion of the above command please verify the vm status

haproxylab]# vagrant status

Current machine states:

halb                      running (virtualbox)<br>
web1                      running (virtualbox)<br>
web2                      running (virtualbox)<br>

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.

Yes the three instances are up now.

Now hit the haproxy URL http://10.11.11.100 now we will get response from one of the nginx server, do refresh and check the response from nginx server 2.

haproxylab]# curl http://10.11.11.100/ <br>
Hello World<br>
Response from : Nginx web1<br>

haproxylab]# curl http://10.11.11.100/ <br>
Hello World<br>
Response from : Nginx web2<br>

Now the Haproxy Load balancer setup completed and running in roundrobin method.

You can ssh the instance and stop one of the nginx web service to verify the haproxy getting response from other server.

SSH nginx web1

vagrant ssh web1 <br>
[vagrant@nginx-web-001 ~]$ sudo systemctl stop nginx

Verify the haproxy url http://10.11.11.100 response , it will give response from nginx web2

Start the nginx web again and it will automatically added into haproxy LB members pool.

[vagrant@nginx-web-001 ~]$ sudo systemctl start nginx

Others:

vagrant halt or vagrant halt instancename # to shutdown the all instance or one instance
  
vagrant destroy or vagrant destroy instancename # to remove all instance or one instance

Note :
This setup only works on your local machine because the vm machine used private network settings. 
Reach me @ gmkmanoj@gmail.com for any questions.
