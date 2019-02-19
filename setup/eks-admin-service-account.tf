# resource "null_resource" "eks_admin_service_account" {
#   provisioner "local-exec" {
#     command = "kubectl apply -f ${path.module}/eks-admin-service-account.yaml"
#   }
#   depends_on = [
#     "null_resource.kube_config",
#   ]
# }

