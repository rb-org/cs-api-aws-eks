## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| codebuild\_role\_arn |  | string | n/a | yes |
| default\_tags | Tags | map | n/a | yes |
| eks\_cluster\_role\_arn | IAM | string | n/a | yes |
| eks\_node\_role\_arn |  | string | n/a | yes |
| eks\_nodes\_sg\_id |  | string | n/a | yes |
| private\_subnets |  | list | n/a | yes |
| public\_subnets |  | list | n/a | yes |
| tux\_sg\_id | Security Groups | string | n/a | yes |
| vpc\_id | Networking | string | n/a | yes |
| cluster\_authenticator | Kubectl | string | `"aws-iam-authenticator"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn |  |
| eks\_cluster\_sg\_id |  |
| endpoint |  |
| kubeconfig\_certificate\_authority\_data |  |
| name |  |