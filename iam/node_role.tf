data "aws_iam_policy_document" "eks_node_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "eks_node_role" {
  name               = "${local.eks_node_role_name}"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.eks_node_assume_role_policy.json}"
}

resource "aws_iam_instance_profile" "eks_node_role_instance_profile" {
  name = "${local.eks_node_role_name}-profile"
  role = "${aws_iam_role.eks_node_role.name}"
}

resource "aws_iam_role_policy_attachment" "eks_node_role_policy_attachment" {
  count      = "${length(compact(var.managed_policy_arns))}"
  role       = "${aws_iam_role.eks_node_role.name}"
  policy_arn = "${var.managed_policy_arns[count.index]}"
}

variable "managed_policy_arns" {
  type = "list"

  default = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
  ]
}
