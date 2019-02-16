# Data Resources

data "template_file" "eks_node_userdata" {
  template = "${file("${path.root}/files/userdata_amz.tpl")}"

  vars {
    cluster_endpoint           = "${var.eks_cluster_endpoint}"
    certificate_authority_data = "${var.eks_cluster_cert_auth_data}"
    cluster_name               = "${var.eks_cluster_name}"
    bootstrap_extra_args       = "${var.bootstrap_extra_args}"
  }
}
