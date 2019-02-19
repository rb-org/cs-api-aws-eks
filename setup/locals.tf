locals {
  account_id       = "${data.aws_caller_identity.current.account_id}"
  region           = "${data.aws_region.current.name}"
  enable_dashboard = "${var.enable_dashboard ? 1:0}"
}
