locals {
  name_prefix = "${terraform.workspace}"

  cluster_name    = "${local.name_prefix}-eks"
  sg_eks_name     = "${local.cluster_name}-cluster-sg"
  sg_eks_api_name = "${local.cluster_name}-api-sg"
}
