# Variables

variable "ami_id" {}
variable "instance_type" {}
variable "eks_cluster_sg_id" {}
variable "iam_instance_profile" {}
variable "key_name" {}

variable "tux_sg_id" {}

variable "enable_monitoring" {
  default = true
}

variable "ebs_optimized" {
  default = false
}

variable "user_data" {
  default = "./files/userdata_amz.sh"
}

variable "root_volume_size" {
  default = 50
}

variable "root_volume_type" {
  default = "gp2"
}

variable "root_volume_delete_on_termination" {
  default = true
}

variable "default_tags" {
  type = "map"
}

variable "enable_cw_metrics" {}

variable "enable_cw_alarm_cpu" {}

variable "enable_cw_alarm_disk_tux" {}

variable "log_group_retention" {
  type = "map"
}

variable "root_iops" {
  default = 0
}

variable "private_subnets" {
  type = "list"
}

variable "vpc_id" {}
variable "disable_api_termination" {}
