#!/bin/bash

component=$1
environment=$2
dnf install ansible -y
#ansible-pull -U https://github.com/daws-86s/ansible-roboshop-roles-tf.git -e component=$component main.yaml
# git clone ansible-playbook
# cd ansible-playbook
# ansible-playbook -i inventory main.yaml

REPO_URL=https://github.com/Gitbycmk/ansible-roboshop-roles-tf-main.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=ansible-roboshop-roles-tf-main

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop/
touch ansible.log

cd $REPO_DIR

# check if ansible repo is cloned or not

# check if repo alredy exists
if [ -d $ANSIBLE_DIR ]; then

    cd $ANSIBLE_DIR
    git pull
else 
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

ansible-playbook -e component=$component -e env=$environment main.yaml