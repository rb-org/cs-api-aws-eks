locals {
  name_prefix = "${terraform.workspace}"

  app_id          = "${var.app_id}"
  cluster_name    = "${local.name_prefix}-eks-${local.app_id}"
  sg_eks_name     = "${local.cluster_name}-cluster-sg"
  sg_eks_api_name = "${local.cluster_name}-api-sg"
}
