output "eks_node_profile_name" {
  value = "${aws_iam_instance_profile.eks_node_role_instance_profile.name}"
}

output "eks_node_role_name" {
  value = "${aws_iam_role.eks_node_role.name}"
}

output "eks_node_role_id" {
  value = "${aws_iam_role.eks_node_role.id}"
}

output "eks_cluster_role_arn" {
  value = "${aws_iam_role.eks_cluster_role.arn}"
}
