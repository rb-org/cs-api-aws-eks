data "aws_iam_policy_document" "eks_cluster_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "eks_cluster_role" {
  name               = "${local.eks_cluster_role_name}"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.eks_cluster_assume_role_policy.json}"
}

resource "aws_iam_role_policy_attachment" "eks_cluster_role_policy_attachment" {
  count      = "${length(compact(var.eks_svc_managed_policy_arns))}"
  role       = "${aws_iam_role.eks_cluster_role.name}"
  policy_arn = "${var.eks_svc_managed_policy_arns[count.index]}"
}

variable "eks_svc_managed_policy_arns" {
  type = "list"

  default = [
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy",
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
  ]
}
