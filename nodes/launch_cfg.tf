resource "aws_launch_configuration" "eks_node" {
  name_prefix          = "${local.launch_cfg_name}"
  image_id             = "${var.ami_id}"
  instance_type        = "${var.instance_type}"
  iam_instance_profile = "${var.iam_instance_profile}"
  key_name             = "${var.key_name}"
  security_groups      = ["${var.tux_sg_id}", "${var.eks_cluster_sg_id}"]

  lifecycle {
    create_before_destroy = true
  }

  enable_monitoring = "${var.enable_monitoring}"
  ebs_optimized     = "${var.ebs_optimized}"
  user_data         = "${data.template_file.eks_node_userdata.rendered}"

  root_block_device {
    volume_size           = "${var.root_volume_size}"
    volume_type           = "${var.root_volume_type}"
    delete_on_termination = "${var.root_volume_delete_on_termination}"
    iops                  = "${local.root_iops}"
  }
}
