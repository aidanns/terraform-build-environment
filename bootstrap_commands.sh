#!/usr/bin/env bash

# Ensure common utilities are available on the container.
yum install -y wget

# Add the EPEL repository to Yum.
wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6*.rpm
