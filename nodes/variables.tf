# Variables

variable "ami_id" {}
variable "instance_type" {}
variable "eks_cluster_sg_id" {}
variable "eks_cluster_name" {}
variable "eks_cluster_endpoint" {}
variable "eks_cluster_cert_auth_data" {}

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

# ASG

variable "asg_min_size" {
  default = 1
}

variable "asg_max_size" {
  default = 2
}

variable "asg_desired_size" {
  default = 1
}

variable "health_check_grace_period" {
  default = 300
}

variable "health_check_type" {
  default = "EC2"
}

variable "force_delete" {
  default = true
}

variable "default_cooldown" {
  default = 60
}

variable "termination_policies" {
  description = "OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default"
  default     = "Default"
}

variable "enabled_metrics" {
  description = "A list of metrics to collect"
  default     = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

variable "wait_for_capacity_timeout" {
  default = "5m"
}

variable "timeouts" {
  default = "10m"
}

variable "bootstrap_extra_args" {
  type        = "string"
  default     = ""
  description = "Passed to the bootstrap.sh script to enable --kublet-extra-args or --use-max-pods."
}
