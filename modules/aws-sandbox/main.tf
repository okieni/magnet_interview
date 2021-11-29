module "vpc" {
  source        = "../aws-vpc"
  owner      = var.employee
  stack         = "sandbox"
  cidr          = var.cidr
  allow_ips       = var.home_ip
  az            = var.az
  subnet_public_cidr = var.subnet_public_cidr
  subnet_private_cidr = var.subnet_private_cidr
}

module "s3" {
  source              = "../aws-s3"
  acl                 = "private"
  bucket_name         = "${var.employee}-sandbox-${random_id.id.hex}"
  block_public_access = true
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  override_json = data.aws_iam_policy_document.s3.json
}

module "ec2" {
   source              = "../aws-ec2-instance"
   subnet_id             = module.vpc.aws_subnet_private_id
   vpc_security_group_ids = ["${element(split(",", module.vpc.security_group_id), 0)}"]
   owner = var.employee
   key_name = var.employee
}

resource "random_id" "id" {
  byte_length = 5
}

data "aws_iam_policy_document" "s3" {
  statement {
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:PutObjectTagging",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:PutObjectVersionAcl",
    ]

    resources = [
      module.s3.bucket_arn,
      "${module.s3.bucket_arn}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::430247891289:user/${var.employee}"]
    }
  }

  statement {
    sid = "AllowSSLRequestsOnly"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    effect = "Deny"
    actions = [
      "s3:*"
    ]

    resources = [
      module.s3.bucket_arn,
      "${module.s3.bucket_arn}/*"
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"

      values = [
        "false",
      ]
    }
  }
}
