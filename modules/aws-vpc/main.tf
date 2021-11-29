resource "aws_vpc" "this" {
  cidr_block           = var.cidr

  tags = {
    "Name"            = "${var.owner}-${var.stack}-vpc"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    "Name"            = "${var.owner}-${var.stack}-igw"
    }
}
