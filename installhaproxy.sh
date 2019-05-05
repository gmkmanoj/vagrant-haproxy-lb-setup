#!/bin/bash

# Installing HAPROXY

yum -y install haproxy

# Updating haproxy configuration

echo "
### FrontEnd configuration ###
frontend webserver
		bind *:80
		default_backend nginxwebserver
		
### Backend configuration ###
backend nginxwebserver
		balance roundrobin
		server nginx1 10.11.11.101:80 check
		server nginx2 10.11.11.102:80 check " >>/etc/haproxy/haproxy.cfg

# Disable selinux

sed -i 's/SELINUX\=enforcing/SELINUX=disabled/g' /etc/selinux/config

# Enabling haproxy service and starting the service

systemctl enable haproxy
systemctl start haproxy
