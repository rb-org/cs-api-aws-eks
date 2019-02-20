#!/bin/sh

# Install AWS CLI
apk add python3
apk add --update py-pip
pip3 install --upgrade pip
pip3 install awscli --upgrade --user
export PATH=~/.local/bin:$PATH
echo 'export PATH=/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc