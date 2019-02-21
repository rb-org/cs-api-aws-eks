## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create\_elb\_service\_role |  | map | n/a | yes |
| eks\_svc\_managed\_policy\_arns |  | list | `<list>` | no |
| managed\_policy\_arns |  | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| eks\_cluster\_role\_arn |  |
| eks\_node\_profile\_name |  |
| eks\_node\_role\_arn |  |
| eks\_node\_role\_id |  |
| eks\_node\_role\_name |  |

