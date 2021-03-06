key_name = "d020-euw"

vpc_cidr = "10.40.0.0/16"

enable_cw_metrics = {
  eks_node = true
}

enable_monitoring = {
  eks_node = true
}

enable_cw_alarm_cpu = {
  eks_node = true
}

enable_cw_alarm_disk_tux = {
  eks_node = true
}

disable_api_term = {
  eks_node = false
}

ebs_optimized = {
  eks_node = "false"
}

instance_type = {
  eks_node = "t3.large"
}

instance_count = {
  eks_node = 2
}
