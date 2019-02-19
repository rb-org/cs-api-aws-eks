resource "null_resource" "kube_config" {
  provisioner "local-exec" {
    command = "aws eks --region ${data.aws_region.current.name} update-kubeconfig --name ${var.cluster_name}"
  }
}

locals {
  apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${cert_auth_data}
    server: ${cluster_endpoint}
  name: ${cluster_arn}
contexts:
- context:
    cluster: ${cluster_arn}
    user: ${cluster_arn}
  name: ${cluster_arn}
current-context: ${cluster_arn}
kind: Config
preferences: {}
users:
- name: ${cluster_arn}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      args:
      - token
      - -i
      - ${cluster_name}
      command: ${cluster_authenticator}
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

