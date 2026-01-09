# === SUBNETS ===
resource "aws_subnet" "public" {
  count = var.public_cidr != "" ? 1 : 0
  
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = true

  tags = {
    Name  = "kuikvengers_yacine_jenkjins_sahmoune_subnetpublic"
    Owner = "yacine"
  }
}

# === ROUTE TABLES ===
resource "aws_route_table" "public" {
  count  = var.public_cidr != "" ? 1 : 0
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name  = "yacine_public_rt"
    Owner = "yacine"
  }
}
# === ASSOCIATIONS ===
resource "aws_route_table_association" "public" {
  count          = var.public_cidr != "" ? 1 : 0
  subnet_id      = aws_subnet.public[0].id
  route_table_id = aws_route_table.public[0].id
}
