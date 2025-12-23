# Subnet public
resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = true

  tags = {
    Name  = "kuikvengers_bougna_yahya_subnetpublic"
    Owner = "yahya"
  }
}

# Subnet privé
resource "aws_subnet" "private" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidr
  availability_zone = var.az

  tags = {
    Name  = "kuikvengers_bougna_yahya_privatesubnet"
    Owner = "yahya"
  }
}

# NAT Gateway (dans le subnet public)
resource "aws_nat_gateway" "this" {
  allocation_id = "eipalloc-032e2813518ebb0e8"
  subnet_id     = aws_subnet.public.id

  tags = {
    Name  = "yahya-nat-gateway"
    Owner = "yahya"
  }
}

# Route table PUBLIC -> IGW existant
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name  = "yahya-public-rt"
    Owner = "yahya"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Route table PRIVÉ -> NAT GW
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name  = "yahya-private-rt"
    Owner = "yahya"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
