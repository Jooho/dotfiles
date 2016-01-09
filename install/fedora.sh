#!/bin/sh

echo "Installing rpm packages"

# kvm
sudo yum install -y virt-manager 
sudo yum install -y libvirt 
sudo yum install -y virt-viewer 
sudo yum install -y qemu-kvm 

# development
sudo yum install -y git 
sudo yum install -y reattach-to-user-namespace 
sudo yum install -y tmux 
sudo yum install -y vim 
sudo yum install -y zsh 
sudo yum install -y python 
sudo yum install -y python-pipn 
sudo yum install -y maven 
sudo yum install -y go 
sudo yum install -y ack 

# message tool
sudo yum install -y xchat 
sudo yum install -y linphone 

# doc tool
sudo yum install -y libreoffice* 

# remote display tools
sudo yum install -y tigervnc 

# neovim
sudo yum install -y dnf-plugins-core
sudo yum -y copr enable dperson/neovim
sudo yum -y install neovim
