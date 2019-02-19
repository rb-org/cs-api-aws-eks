locals {
  name_prefix = "${terraform.workspace}"

  cluster_name    = "${local.name_prefix}-eks"
  sg_eks_name     = "${local.cluster_name}-cluster-sg"
  sg_eks_api_name = "${local.cluster_name}-api-sg"

  kubeconfig = <<KUBECFG
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${aws_eks_cluster.main.certificate_authority.0.data}
    server: ${aws_eks_cluster.main.endpoint}
  name: ${aws_eks_cluster.main.arn}
contexts:
- context:
    cluster: ${aws_eks_cluster.main.arn}
    user: ${aws_eks_cluster.main.arn}
  name: ${aws_eks_cluster.main.arn}
current-context: ${aws_eks_cluster.main.arn}
kind: Config
preferences: {}
users:
- name: ${aws_eks_cluster.main.arn}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      args:
      - token
      - -i
      - "${aws_eks_cluster.main.name}"
      command: ${var.cluster_authenticator}
KUBECFG

  aws_auth_cm = <<AWS_AUTH
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${var.eks_node_role_arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
AWS_AUTH

  eks_admin_svc_acc = <<EKS_ADMIN
apiVersion: v1
kind: ServiceAccount
metadata:
  name: eks-admin
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: eks-admin
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: eks-admin
  namespace: kube-system
EKS_ADMIN
}
