output "eks_cluster_arn" {
  value = "${module.cluster.arn}"
}

output "kubeconfig_path" {
  value = "${module.cluster.kubeconfig_path}"
}
