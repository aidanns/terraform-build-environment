#!/usr/bin/env bash

cd /root

# Ensure common utilities are available on the container.
yum install -y wget vim

# Add the EPEL repository to Yum.
wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6*.rpm

# Install and start the SSH server.
yum install -y openssh-server
/etc/init.d/sshd start

# Allow key based authentication.
mkdir /root/.ssh
chmod 700 /root/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrP+Ct57DP+Dg73ncVaTSAffUlRE6kS3cSO7damY4asuG0RIazoXzAdErpAbiMFXaMBiqTflZ1FLG8d97TcKWp0GGSRj+rzIO4Xyq7YMmNBgSJdycguj552LLEAFye0QQk2celHHzwM8VEDkLqhEX8zjZdcksOs9GlxtF7B03/TQ+oraCerYBRLT6E+UpTe9icJIX018/3x8wHeleMChGf+EVsYiJ0Hn3tN3y5L+HMiM6eZCA9P5mwGNpWPTNOFWt81cdTzqO4RVu4hiOXjkKOSrfYuTiSaO7DUTola4B96dSxGNWRMz+IiT7u2+PJRyGhw54a8MUlruEEAOY8e5sH aidan@leeloo.local" > /root/.ssh/authorized_keys
chmod 644 /root/.ssh/authorized_keys
