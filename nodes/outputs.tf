# Outputs

output "eks_nodes_sg_id" {
  value = "${aws_security_group.eks.id}"
}
