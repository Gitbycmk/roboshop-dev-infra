#!/bin/bash

component=$1
dnf install ansible -y
ansible-pull -U https://github.com/Gitbycmk/ansible-roboshop-roles-tf-main.git -e component=$component main.yaml