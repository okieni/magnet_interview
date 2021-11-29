# Subnets
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_private_cidr
  availability_zone = var.az

  tags = {
    Name            = "${var.owner}-${var.stack}-private-subnet"
    visibility      = "private"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_public_cidr
  availability_zone = var.az

  tags = {
    Name            = "${var.owner}-${var.stack}-public-subnet"
    visibility      = "public"
  }
}

# NAT Gateway
resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name            = "${var.owner}-${var.stack}-natgwIP"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    "Name"            = "${var.owner}-${var.stack}-natgw"
    "env"             = var.owner
  }
}

# Route tables and routes - private
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    "Name"            = "${var.owner}-${var.stack}-private-rtb"
    "visibility"      = "private"
    "env"             = var.owner
  }
}

resource "aws_route" "private_internet" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

# Route tables and routes - public
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    "Name"            = "${var.owner}-${var.stack}-public-rtb"
    "visibility"      = "public"
    "env"             = var.owner
  }
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

# Route table associations
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
