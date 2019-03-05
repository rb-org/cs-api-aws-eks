# Configure Kubectl
# resource "local_file" "kube_config" {
#   content  = "${local.kubeconfig}"
#   filename = "${path.root}/output/config"
#   depends_on = [
#     "aws_eks_cluster.main",
#   ]
# }
# resource "null_resource" "kube_cfg" {
#   provisioner "local-exec" {
#     command = <<COMMAND
#       aws eks --region ${local.region} update-kubeconfig --name ${aws_eks_cluster.main.name}
#     COMMAND
#   }
#   triggers {
#     kubeconfig = "${local.kubeconfig}"
#   }
#   depends_on = [
#     "local_file.kube_config",
#   ]
# }
# # Configure eks_admin
# resource "local_file" "eks_admin_svc_acc" {
#   content  = "${local.eks_admin_svc_acc}"
#   filename = "${path.root}/output/eks-admin-service-account.yaml"
#   depends_on = [
#     "null_resource.kube_cfg",
#   ]
# }
# resource "null_resource" "eks_admin" {
#   provisioner "local-exec" {
#     command = "kubectl apply -f ${path.root}/output/eks-admin-service-account.yaml"
#   }
#   triggers {
#     eks_admin = "${local.eks_admin_svc_acc}"
#   }
#   depends_on = [
#     "local_file.eks_admin_svc_acc",
#     "null_resource.kube_cfg",
#   ]
# }
# # Configure AWS Auth for nodes
# resource "local_file" "aws_auth_cm" {
#   content  = "${local.aws_auth_cm}"
#   filename = "${path.root}/output/aws-auth-cm.yaml"
# }
# resource "null_resource" "aws_auth_cm" {
#   provisioner "local-exec" {
#     command = "kubectl apply -f ${path.root}/output/aws-auth-cm.yaml"
#   }
#   triggers {
#     aws_auth_cm = "${local.aws_auth_cm}"
#   }
#   depends_on = [
#     "local_file.aws_auth_cm",
#     "null_resource.kube_cfg",
#   ]
# }

