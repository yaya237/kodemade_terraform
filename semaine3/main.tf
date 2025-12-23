module "networking" {
  source = "./modules/networking"

  vpc_id       = data.aws_vpc.shared.id
  igw_id       = data.aws_internet_gateway.shared.id
  public_cidr  = "10.0.50.0/24"
  private_cidr = "10.0.60.0/24"
  az           = "eu-west-3a"
}

module "security" {
  source = "./modules/security"
  vpc_id = data.aws_vpc.shared.id
}

module "ec2" {
  source = "./modules/ec2"

  public_subnet_id  = module.networking.public_subnet_id
  private_subnet_id = module.networking.private_subnet_id
  public_sg_id      = module.security.public_sg_id
  private_sg_id     = module.security.private_sg_id
  key_name          = var.key_name
}
