data "aws_ami" "amz_eks_node" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amazon-eks-node-*-v*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  owners = ["602401143452"]
}

data "aws_region" "current" {}
