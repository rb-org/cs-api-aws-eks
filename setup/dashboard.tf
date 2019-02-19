# resource "null_resource" "dashboard" {
#   provisioner "local-exec" {
#     command = <<COMMAND
#       kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
#       kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/heapster.yaml
#       kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/influxdb.yaml
#       kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/rbac/heapster-rbac.yaml
#     COMMAND
#   }
#   depends_on = [
#     "null_resource.kube_config",
#     "null_resource.eks_admin_service_account",
#   ]
# }

