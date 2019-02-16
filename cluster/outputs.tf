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
