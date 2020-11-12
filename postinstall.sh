#!/bin/bash

# Author: James Ambrose

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

sudo yum update
sudo dnf update

echo "Enter a user to create for a new sudo user"
read sudoUserName

adduser $sudoUserName
echo "Enter password for: $sudoUserName"
passwd $sudoUserName

usermod -aG wheel $sudoUserName
echo "Outputting User Info for : $sudoUserName"
id $sudoUserName