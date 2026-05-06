#!/bin/bash

dnf install ansible -y
ansible-pull -U https://github.com/Gitbycmk/ansible-roboshop-roles-tf-main.git -e component=mongodb main.yaml
