# Security Groups
variable "tux_sg_id" {}

# CS API
variable "app_id" {
  default = "cs-api"
}

# Networking
variable "vpc_id" {}

variable "public_subnets" {
  type = "list"
}

# IAM
variable "eks_cluster_role_arn" {}

# Tags
variable "default_tags" {
  type = "map"
}
