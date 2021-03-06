resource "aws_eks_cluster" "main" {
  name     = "${local.cluster_name}"
  role_arn = "${var.eks_cluster_role_arn}"

  vpc_config {
    subnet_ids         = ["${var.public_subnets}", "${var.private_subnets}"]
    security_group_ids = ["${var.tux_sg_id}", "${aws_security_group.eks.id}", "${aws_security_group.eks_api.id}"]
  }

  # provisioner "local-exec" {
  #   command = <<COMMAND
  #     aws eks --region ${local.region} update-kubeconfig --name ${aws_eks_cluster.main.name}
  #   COMMAND
  # }
}
