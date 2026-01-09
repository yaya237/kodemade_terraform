data "aws_vpc" "kuikops_vpc" {
  filter {
    name   = "tag:Name"
    values = ["kuikvengers_vpc"]
  }
}

data "aws_internet_gateway" "kuikops_ig" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.kuikops_vpc.id]
  }
}
