output "eks_cluster_arn" {
  value = "${module.cluster.arn}"
}

output "eks_cluster_name" {
  value = "${module.cluster.name}"
}

output "eks_cluster_region" {
  value = "${module.cluster.region}"
}

output "eks_cluster_endpoint" {
  value = "${module.cluster.endpoint}"
}

# output "kubeconfig_ssm_path" {
#   value = "${module.cluster.kubeconfig_path}"
# }

output "eks_cluster_cert_auth_data" {
  value = "${module.cluster.kubeconfig_certificate_authority_data}"
}

output "eks_node_role_arn" {
  value = "${module.iam.eks_node_role_arn}"
}
