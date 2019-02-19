# Security Groups
variable "tux_sg_id" {}

variable "eks_nodes_sg_id" {}

# Networking
variable "vpc_id" {}

variable "public_subnets" {
  type = "list"
}

variable "private_subnets" {
  type = "list"
}

# IAM
variable "eks_cluster_role_arn" {}

variable "eks_node_role_arn" {}

# Tags
variable "default_tags" {
  type = "map"
}

# Kubectl
variable "cluster_authenticator" {
  default = "aws-iam-authenticator"
}
