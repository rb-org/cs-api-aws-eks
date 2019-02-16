#!/binbash

curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/darwin/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo cp ./aws-iam-authenticator /usr/local/aws-iam-authenticator && export PATH=/usr/local:$PATH
echo 'export PATH=/usr/local:$PATH' >> ~/.bash_profile
echo 'export PATH=/usr/local:$PATH' >> ~/.zshrc

# Check installed correctly
aws-iam-authenticator help

# Update kube config
aws eks --region eu-west-1 update-kubeconfig --name d020-eks-cs-api

# Install dashboards
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/heapster.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/influxdb.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/rbac/heapster-rbac.yaml

# Apply eks-admin service account
kubectl apply -f eks-admin-service-account.yaml

# Connect to dashboard
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')

# Start proxy
kubectl proxy
