module "aws-sandbox-kieniObuzor" {
  source         = "../../modules/aws-sandbox"
  employee       = "kieniobuzor"
  cidr           = "10.118.0.0/16"
  home_ip        = ["142.182.181.7/32"]
  subnet_public_cidr = "10.118.20.0/23"
  subnet_private_cidr = "10.118.18.0/23"
}
