output "eks_cluster_arn" {
  value = "${module.cluster.arn}"
}

output "eks_cluster_name" {
  value = "${module.cluster.name}"
}

output "eks_cluster_region" {
  value = "${module.cluster.region}"
}

output "kubeconfig_path" {
  value = "${module.cluster.kubeconfig_path}"
}
