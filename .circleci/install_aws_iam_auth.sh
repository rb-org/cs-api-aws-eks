#!/bin/sh
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
cp ./aws-iam-authenticator /usr/local/aws-iam-authenticator 
export PATH=/usr/local:$PATH
echo 'export PATH=/usr/local:$PATH' >> ~/.bashrc
source ~/.bashrc