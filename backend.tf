terraform {
  required_version = "~>0.11.11"

  backend "s3" {
    bucket                  = "xyz-tfm-state"
    region                  = "eu-west-1"
    key                     = "cs-api-eks.tfstate"
    encrypt                 = "true"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "default"
  }
}

data "terraform_remote_state" "cs_api_base" {
  backend = "s3"

  config {
    bucket = "${var.remote_state_s3}"
    region = "eu-west-1"
    key    = "env:/${terraform.workspace}/cs-api-base.tfstate"
  }
}

data "terraform_remote_state" "cs_api_ec2" {
  backend = "s3"

  config {
    bucket = "${var.remote_state_s3}"
    region = "eu-west-1"
    key    = "env:/${terraform.workspace}/cs-api-ec2.tfstate"
  }
}

data "terraform_remote_state" "cs_api_cicd" {
  backend = "s3"

  config {
    bucket = "${var.remote_state_s3}"
    region = "eu-west-1"
    key    = "env:/${terraform.workspace}/cs-api-cicd.tfstate"
  }
}
