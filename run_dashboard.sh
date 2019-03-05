#!/bin/bash
TOKEN=$(kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}') |grep token: | awk '{print $2}')

echo "Auth token: $TOKEN"

echo "##############################"
read  -n 1 -p "Start kubectl proxy (y/n)?" proxystart
if [[ $proxystart == "y" || $proxystart == "Y" ]]; then
    echo ""
    echo "Starting kubectl proxy"
    echo "Dashboard URL:  'http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/'"
    kubectl proxy
else 
    echo ""
    echo "Not starting kubectl proxy"
    echo "Dashboard URL:  'http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/'"
fi

