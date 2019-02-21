## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_id |  | string | n/a | yes |
| db\_clients\_sg\_id |  | string | n/a | yes |
| default\_tags |  | map | n/a | yes |
| disable\_api\_termination |  | string | n/a | yes |
| eks\_cluster\_cert\_auth\_data |  | string | n/a | yes |
| eks\_cluster\_endpoint |  | string | n/a | yes |
| eks\_cluster\_name |  | string | n/a | yes |
| eks\_cluster\_sg\_id |  | string | n/a | yes |
| enable\_cw\_alarm\_cpu |  | string | n/a | yes |
| enable\_cw\_alarm\_disk\_asg |  | string | n/a | yes |
| enable\_cw\_metrics |  | string | n/a | yes |
| iam\_instance\_profile |  | string | n/a | yes |
| instance\_type |  | string | n/a | yes |
| key\_name |  | string | n/a | yes |
| log\_group\_retention |  | map | n/a | yes |
| private\_subnets |  | list | n/a | yes |
| tux\_sg\_id |  | string | n/a | yes |
| vpc\_id |  | string | n/a | yes |
| asg\_desired\_size |  | string | `"1"` | no |
| asg\_max\_size |  | string | `"2"` | no |
| asg\_min\_size |  | string | `"1"` | no |
| bootstrap\_extra\_args | Passed to the bootstrap.sh script to enable --kublet-extra-args or --use-max-pods. | string | `""` | no |
| default\_cooldown |  | string | `"60"` | no |
| disk\_comparison\_operator |  | string | `"GreaterThanThreshold"` | no |
| disk\_datapoints\_to\_alarm |  | string | `"5"` | no |
| disk\_evaluation\_periods |  | string | `"5"` | no |
| disk\_metric\_desc |  | string | `"Low Disk Space"` | no |
| disk\_metric\_name |  | string | `"disk_used_percent"` | no |
| disk\_namespace |  | string | `"CWAgent"` | no |
| disk\_period |  | string | `"60"` | no |
| disk\_statistic |  | string | `"Average"` | no |
| disk\_threshold |  | string | `"75"` | no |
| disk\_unit |  | string | `"Percent"` | no |
| diskspace\_disks |  | list | `<list>` | no |
| ebs\_optimized |  | string | `"false"` | no |
| enable\_monitoring |  | string | `"true"` | no |
| enabled\_metrics | A list of metrics to collect | list | `<list>` | no |
| force\_delete |  | string | `"true"` | no |
| health\_check\_grace\_period |  | string | `"300"` | no |
| health\_check\_type |  | string | `"EC2"` | no |
| path |  | list | `<list>` | no |
| root\_iops |  | string | `"0"` | no |
| root\_volume\_delete\_on\_termination |  | string | `"true"` | no |
| root\_volume\_size |  | string | `"50"` | no |
| root\_volume\_type |  | string | `"gp2"` | no |
| termination\_policies | OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default | string | `"Default"` | no |
| timeouts |  | string | `"10m"` | no |
| user\_data |  | string | `"./files/userdata_amz.sh"` | no |
| wait\_for\_capacity\_timeout |  | string | `"5m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| eks\_nodes\_sg\_id |  |
