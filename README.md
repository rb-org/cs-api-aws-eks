# Terraform - CS API - AWS EKS

## Setup and configuration

### Installing aws-iam-authenticator

![link](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html_)

See shell script in ./files

### Installing the Kubernetes Dashboard

![link](https://docs.aws.amazon.com/eks/latest/userguide/dashboard-tutorial.html)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| disable\_api\_term |  | map | n/a | yes |
| ebs\_optimized |  | map | n/a | yes |
| enable\_cw\_alarm\_cpu | If true, the launched EC2 instance will have create cpu alarms | map | n/a | yes |
| enable\_cw\_alarm\_disk\_asg | If true, the launched EC2 instance will have create disk alarms | map | n/a | yes |
| enable\_cw\_metrics | Monitoring | map | n/a | yes |
| enable\_monitoring |  | map | n/a | yes |
| instance\_type | EKS Nodes | map | n/a | yes |
| key\_name |  | string | n/a | yes |
| account\_id | AWS Account ID | string | `""` | no |
| create\_elb\_service\_role | Service Role | map | `<map>` | no |
| default\_tags | Map of default tags applied to all resources | map | `<map>` | no |
| log\_group\_retention |  | map | `<map>` | no |
| region | AWS Region | string | `"eu-west-1"` | no |
| remote\_state\_s3 |  | string | `"xyz-tfm-state"` | no |