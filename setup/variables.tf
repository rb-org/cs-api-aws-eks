variable "eks_node_role_arn" {}

variable "enable_dashboard" {
  default = true
}

variable "cert_auth_data" {}
variable "cluster_endpoint" {}
variable "cluster_arn" {}
variable "cluster_name" {}

variable "cluster_authenticator" {
  default = "aws-iam-authenticator"
}
