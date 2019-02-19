resource "null_resource" "node_cfg_map" {
  provisioner "local-exec" {
    command = "kubectl apply -f ${path.root}/output/aws-auth-cm.yaml"
  }

  depends_on = [
    "local_file.node_cfg_map",
    "null_resource.kube_config",
  ]
}

resource "local_file" "node_cfg_map" {
  content  = "${data.template_file.node_cfg_map.rendered}"
  filename = "${path.root}/output/aws-auth-cm.yaml"
}

data "template_file" "node_cfg_map" {
  template = "${file("${path.module}/aws-auth-cm.tpl")}"

  vars = {
    node_role_arn = "${var.eks_node_role_arn}"
  }
}
