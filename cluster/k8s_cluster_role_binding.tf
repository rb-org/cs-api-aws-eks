resource "kubernetes_cluster_role_binding" "main" {
  metadata {
    name = "eks-admin"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "eks-admin"
    api_group = "kube-system"
  }

  depends_on = [
    "null_resource.kube_cfg",
    "aws_eks_cluster.main",
    "kubernetes_service_account.eks_admin",
  ]
}
