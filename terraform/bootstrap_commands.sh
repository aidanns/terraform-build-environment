#!/usr/bin/env bash

cd /root

# Ensure common utilities are available on the container.
yum -y update
yum install -y epel-release
yum install -y initscripts
yum install -y wget 
yum install -y vim
yum clean all

# Install and start the SSH server.
yum install -y openssh-server
systemctl start sshd.service

# Allow key based authentication.
mkdir /root/.ssh
chmod 700 /root/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrP+Ct57DP+Dg73ncVaTSAffUlRE6kS3cSO7damY4asuG0RIazoXzAdErpAbiMFXaMBiqTflZ1FLG8d97TcKWp0GGSRj+rzIO4Xyq7YMmNBgSJdycguj552LLEAFye0QQk2celHHzwM8VEDkLqhEX8zjZdcksOs9GlxtF7B03/TQ+oraCerYBRLT6E+UpTe9icJIX018/3x8wHeleMChGf+EVsYiJ0Hn3tN3y5L+HMiM6eZCA9P5mwGNpWPTNOFWt81cdTzqO4RVu4hiOXjkKOSrfYuTiSaO7DUTola4B96dSxGNWRMz+IiT7u2+PJRyGhw54a8MUlruEEAOY8e5sH aidan@leeloo.local" > /root/.ssh/authorized_keys
chmod 644 /root/.ssh/authorized_keys
