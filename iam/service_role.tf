resource "aws_iam_service_linked_role" "AWSServiceRoleForElasticLoadBalancing" {
  count            = "${local.create_elb_service_role}"
  aws_service_name = "elasticloadbalancing.amazonaws.com"
}
