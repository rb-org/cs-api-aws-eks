locals {
  eks_node_role_name = "${terraform.workspace}-eks-node-role"

  eks_cluster_role_name = "${terraform.workspace}-eks-cluster-role"

  create_elb_service_role = "${var.create_elb_service_role[terraform.workspace] ? 1 :0}"
}
