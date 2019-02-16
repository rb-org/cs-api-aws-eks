locals {
  eks_node_role_name = "${terraform.workspace}-eks-node-role"

  eks_cluster_role_name = "${terraform.workspace}-eks-cluster-role"
}
