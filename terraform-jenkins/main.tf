module "network" {
  source              = "./modules/network"
  vpc_id              = data.aws_vpc.kuikops_vpc.id
  igw_id              = data.aws_internet_gateway.kuikops_ig.id
  public_cidr         = var.public_cidr       
  az                  = var.az
}


module "sg_public" {
  source = "./modules/sg-public"
  vpc_id = data.aws_vpc.kuikops_vpc.id
}

module "ec2_public" {
  source = "./modules/ec2"
  subnet_id                 = module.network.public_subnet_id   
  sg_id                     = module.sg_public.sg_id
  key_name                  = var.key_name
  associate_public_ip_address = true
  instance_name             = "ec2-public-yacine-jenkins"
  tags = {
  Projet      = "Jenkins-Terraform-TP"
  Groupe      = "1"
  Environment = "Test"
  } 
}

