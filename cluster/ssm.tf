# resource "aws_ssm_parameter" "kubeconfig" {
#   name      = "/${local.kubeconfig_path}"
#   overwrite = true
#   type      = "String"
#   value     = "${local.kubeconfig}"
# }

