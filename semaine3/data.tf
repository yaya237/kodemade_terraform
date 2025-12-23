data "aws_vpc" "shared" {
  filter {
    name   = "tag:Name"
    values = ["kuikvengers_vpc"]
  }
}

data "aws_internet_gateway" "shared" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.shared.id]
  }
}
