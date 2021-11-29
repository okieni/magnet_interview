resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  availability_zone           = var.region
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  iam_instance_profile        = aws_iam_instance_profile.this.id
  key_name                    = var.key_name
  associate_public_ip_address = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "80"
    delete_on_termination = true
  }

  tags = {
    Name              = "${var.owner}-sandbox-instance"
  }
}

resource "aws_volume_attachment" "this" {
  device_name = "xvdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = aws_instance.this.id
}

resource "aws_ebs_volume" "this" {
  availability_zone = var.region
  size              = 100

  tags = {
    Name = "${var.owner}-sandbox"
  }
}

resource "aws_network_interface" "eni1" {
  subnet_id         = var.subnet_id
  security_groups   = var.vpc_security_group_ids
  private_ips_count = 1

  attachment {
    instance     = aws_instance.this.id
    device_index = 1
  }
}

resource "aws_iam_instance_profile" "this" {
  name = "${var.owner}-sandbox-profile"
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name = "${var.owner}-sandbox-role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
