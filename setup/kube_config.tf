resource "null_resource" "kube_config" {
  provisioner "local-exec" {
    command = "aws eks --region ${data.aws_region.current.name} update-kubeconfig --name ${var.cluster_name}"
  }
}

# resource "null_resource" "kube_config" {
#   provisioner "local-exec" {
#     command = <<COMMAND
#       cp ${path.root}/output/config-eks-master ~/.kube/config
#       KUBECONFIG=~/.kube/config
#     COMMAND
#   }
#   depends_on = [
#     "local_file.kube_config",
#   ]
# }
# resource "local_file" "kube_config" {
#   content  = "${data.template_file.kube_config.rendered}"
#   filename = "${path.root}/output/config-eks-master"
# }
# data "template_file" "kube_config" {
#   template = "${file("${path.module}/kube_config.tpl")}"
#   vars = {
#     cert_auth_data        = "${var.cert_auth_data}"
#     cluster_endpoint      = "${var.cluster_endpoint}"
#     cluster_arn           = "${var.cluster_arn}"
#     cluster_name          = "${var.cluster_name}"
#     cluster_authenticator = "${var.cluster_authenticator}"
#   }
# }

