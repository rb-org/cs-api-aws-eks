# SG for Cluster communication
resource "aws_security_group" "eks" {
  name        = "${local.sg_eks_name}"
  description = "EKS Cluster & Nodes"
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

resource "aws_security_group_rule" "ir_eks_nodes_t" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = -1
  source_security_group_id = "${var.eks_nodes_sg_id}"
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

# Cluster API access

resource "aws_security_group" "eks_api" {
  name        = "${local.sg_eks_api_name}"
  description = "EKS Cluster API access external"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.default_tags, map(
      "Name", "${local.sg_eks_api_name}"
    ))}"
}

##########
# Ingress
##########
resource "aws_security_group_rule" "ir_eks_api_t" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["1.1.1.1/32"]
  security_group_id = "${aws_security_group.eks_api.id}"
}

#########
# Egress
#########
resource "aws_security_group_rule" "er_eks_api" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.eks_api.id}"
}
