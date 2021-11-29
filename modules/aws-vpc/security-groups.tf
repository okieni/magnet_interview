# VPC Security Group
resource "aws_security_group" "this" {
  name        = "${var.owner}-access-sg"
  description = "Allows ssh/rdp traffic from ${var.owner}"
  vpc_id      = aws_vpc.this.id

  tags = {
    "Name"            = "${var.owner}-access-sg"
  }
}

resource "aws_security_group_rule" "this_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.allow_ips
  security_group_id = aws_security_group.this.id
  description       = "Allows ssh traffic from ${var.owner}"
}

resource "aws_security_group_rule" "this_rdp" {
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = var.allow_ips
  security_group_id = aws_security_group.this.id
  description       = "Allows rdp traffic from ${var.owner}"
}

resource "aws_security_group_rule" "this_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
  description       = "Allows all egress traffic"
}
