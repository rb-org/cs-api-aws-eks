# Outputs

output "endpoint" {
  value = "${aws_eks_cluster.main.endpoint}"
}

output "kubeconfig_certificate_authority_data" {
  value = "${aws_eks_cluster.main.certificate_authority.0.data}"
}

output "eks_cluster_sg_id" {
  value = "${aws_security_group.eks.id}"
}

output "name" {
  value = "${aws_eks_cluster.main.name}"
}

output "arn" {
  value = "${aws_eks_cluster.main.arn}"
}

output "kubeconfig_path" {
  value = "${local.kubeconfig_path}"
}

output "region" {
  value = "~${data.aws_region.current.name}"
}
