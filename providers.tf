provider "aws" {
  version                 = "~>1.9"
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  allowed_account_ids     = ["${var.account_id}"]
}

provider "kubernetes" {
  # host = "https://B93D3CE64D0C98D4BFDFD9D3CFAA0A26.sk1.eu-west-1.eks.amazonaws.com"
  config_path = "~/.kube/config-eks-master"
}
