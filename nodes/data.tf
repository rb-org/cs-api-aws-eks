# Data Resources

data "template_file" "eks_node_userdata" {
  template = "${file(var.user_data)}"
}
