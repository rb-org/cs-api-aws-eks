locals {
  name_prefix          = "${terraform.workspace}-eks-node"
  launch_cfg_name      = "${local.name_prefix}-lc"
  placement_group_name = "${local.name_prefix}-pg"
  asg_name             = "${local.name_prefix}-asg"
  root_iops            = "${var.root_volume_type == "io1" ? var.root_iops : "0"}"
  cw_agent_ssm_path    = "/${terraform.workspace}/cw_agent/${local.name_prefix}"
  log_group_name       = "/xyz/${local.name_prefix}-log-group"
  log_prefix           = "xyz"
  sg_eks_name          = "${local.name_prefix}-sg"
}
