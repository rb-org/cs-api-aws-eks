apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${cert_auth_data}
    server: ${cluster_endpoint}
  name: ${cluster_arn}
contexts:
- context:
    cluster: ${cluster_arn}
    user: ${cluster_arn}
  name: ${cluster_arn}
current-context: ${cluster_arn}
kind: Config
preferences: {}
users:
- name: ${cluster_arn}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      args:
      - token
      - -i
      - ${cluster_name}
      command: ${cluster_authenticator}

