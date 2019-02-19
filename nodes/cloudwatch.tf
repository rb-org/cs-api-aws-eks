# CloudWatch Log Groups 
resource "aws_cloudwatch_log_group" "cw_log_group" {
  name              = "${local.log_group_name}"
  retention_in_days = "${var.log_group_retention[terraform.workspace]}"

  tags = "${merge(
    var.default_tags, 
    map(
      "Name", "${local.log_group_name}",
      "Workspace", format("%s", terraform.workspace)
    )
  )}"
}

# resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarm_asg" {
#   count = "${local.cloudwatch_alarm_disk_asg_count}"


#   alarm_name          = "${local.name_prefix / length(var.diskspace_disks)} - ${var.diskspace_disks [(count.index)  % length(var.diskspace_disks)]} - ${var.disk_metric_desc}"
#   alarm_description   = "${var.disk_metric_desc}"
#   comparison_operator = "${var.disk_comparison_operator}"
#   evaluation_periods  = "${var.disk_evaluation_periods}"
#   datapoints_to_alarm = "${var.disk_datapoints_to_alarm}"
#   metric_name         = "${var.disk_metric_name}"
#   namespace           = "${var.disk_namespace}"
#   period              = "${var.disk_period}"
#   statistic           = "${var.disk_statistic}"
#   threshold           = "${var.disk_threshold}"
#   unit                = "${var.disk_unit}"
#   treat_missing_data  = "${var.disk_treat_missing_data}"


#   dimensions {
#     AutoScalingGroupName = ""
#     InstanceId   = "${var.instance_ids[count.index / length(var.diskspace_disks)]}"
#     path         = "${var.path[count.index % length(var.diskspace_disks)]}"
#     device       = "${var.diskspace_disks[count.index % length(var.diskspace_disks)]}"
#     ImageId      = "${element(var.ami_id, (count.index ) / length(var.diskspace_disks))}"
#     InstanceType = "${var.instance_type}"
#     fstype       = "${var.fstype}"
#   }


#   actions_enabled = "${var.enable_cw_alarm_disk_tux}"
#   ok_actions      = ["${local.sns_ok_arn}"]
#   alarm_actions   = ["${local.sns_urgent_arn}"]
# }

