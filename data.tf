data "aws_ami" "eks_node" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  # filter {
  #   name   = "owner-alias"
  #   values = ["canonical"]
  # }

  owners = ["099720109477"]
}

data "aws_region" "current" {}
