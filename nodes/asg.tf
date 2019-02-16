# resource "aws_autoscaling_group" "bar" {
#   name                 = "terraform-asg-example"
#   launch_configuration = "${aws_launch_configuration.as_conf.name}"
#   min_size             = 1
#   max_size             = 2
#   lifecycle {
#     create_before_destroy = true
#   }
# }

resource "aws_placement_group" "eks" {
  name     = "${local.placement_group_name}"
  strategy = "partition"
}

resource "aws_autoscaling_group" "main" {
  name_prefix               = "${local.name_prefix}"
  max_size                  = "${var.asg_max_size}"
  min_size                  = "${var.asg_min_size}"
  health_check_grace_period = "${var.health_check_grace_period}"
  health_check_type         = "${var.health_check_type}"
  desired_capacity          = "${var.asg_desired_size}"
  force_delete              = "${var.force_delete}"
  placement_group           = "${aws_placement_group.eks.id}"
  launch_configuration      = "${aws_launch_configuration.eks_node.name}"
  vpc_zone_identifier       = ["${var.private_subnets}"]

  termination_policies      = ["${var.termination_policies}"]
  default_cooldown          = "${var.default_cooldown}"
  enabled_metrics           = "${var.enabled_metrics}"
  wait_for_capacity_timeout = "${var.wait_for_capacity_timeout}"

  timeouts {
    delete = "${var.timeouts}"
  }

  tag {
    key                 = "Name"
    value               = "${local.name_prefix}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Workspace"
    value               = "${terraform.workspace}"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.eks_cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }
}
