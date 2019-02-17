# SG for Cluster communication
resource "aws_security_group" "eks" {
  name        = "${local.sg_eks_name}"
  description = "EKS Nodes"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.default_tags, map(
      "Name", "${local.sg_eks_name}"
    ))}"
}

##########
# Ingress
##########
resource "aws_security_group_rule" "ir_eks_t" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  self              = true
  security_group_id = "${aws_security_group.eks.id}"
}

resource "aws_security_group_rule" "ir_eks_cluster_t" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = -1
  source_security_group_id = "${var.eks_cluster_sg_id}"
  security_group_id        = "${aws_security_group.eks.id}"
}

#########
# Egress
#########
resource "aws_security_group_rule" "er_eks" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.eks.id}"
}
