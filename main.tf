module "iam" {
  source = "./iam"
}

module "cluster" {
  source = "./cluster"

  # Networking
  vpc_id          = "${data.terraform_remote_state.cs_api_base.vpc_id}"
  public_subnets  = "${data.terraform_remote_state.cs_api_base.public_subnets_ids}"
  private_subnets = "${data.terraform_remote_state.cs_api_base.private_subnets_ids}"

  # Security Groups
  tux_sg_id = "${data.terraform_remote_state.cs_api_base.tux_sg_id}"

  # IAM
  eks_cluster_role_arn = "${module.iam.eks_cluster_role_arn}"

  # Tags
  default_tags = "${var.default_tags}"
}

module "nodes" {
  source = "./nodes"

  # Network
  vpc_id          = "${data.terraform_remote_state.cs_api_base.vpc_id}"
  private_subnets = "${data.terraform_remote_state.cs_api_base.private_subnets_ids}"

  # Instance
  instance_type           = "${var.instance_type["eks_node"]}"
  iam_instance_profile    = "${module.iam.eks_node_profile_name}"
  ami_id                  = "${data.aws_ami.amz_eks_node.image_id}"
  key_name                = "${var.key_name}"
  disable_api_termination = "${var.disable_api_term["eks_node"]}"
  ebs_optimized           = "${var.ebs_optimized["eks_node"]}"

  # Security Groups
  tux_sg_id         = "${data.terraform_remote_state.cs_api_base.tux_sg_id}"
  eks_cluster_sg_id = "${module.cluster.eks_cluster_sg_id}"

  # Tags
  default_tags = "${var.default_tags}"

  # Monitoring 
  enable_cw_metrics        = "${var.enable_cw_metrics["eks_node"]}"
  enable_monitoring        = "${var.enable_monitoring["eks_node"]}"
  enable_cw_alarm_cpu      = "${var.enable_cw_alarm_cpu["eks_node"]}"
  enable_cw_alarm_disk_tux = "${var.enable_cw_alarm_disk_tux["eks_node"]}"
  log_group_retention      = "${var.log_group_retention}"
}
