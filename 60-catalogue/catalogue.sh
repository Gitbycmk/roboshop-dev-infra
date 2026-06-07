#!/bin/bash

component=$1
environment=$2

dnf install ansible -y

REPO_URL=https://github.com/Gitbycmk/ansible-roboshop-roles-tf-main.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=ansible-roboshop-roles-tf-main

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop
touch /var/log/roboshop/ansible.log

cd $REPO_DIR

if [ -d $ANSIBLE_DIR ]; then
    cd $ANSIBLE_DIR
    git pull
else
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

echo "Component: $component"
echo "Environment: $environment"

ansible-playbook -e component=$component -e env=$environment main.yaml