#!/bin/bash

# Installing nginx

yum -y install epel-release
yum -y install nginx

# Disabling SELINUX

sed -i 's/SELINUX\=enforcing/SELINUX=disabled/g' /etc/selinux/config

# Enabling Nginx service and starting the service

systemctl enable nginx
systemctl start nginx
