data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-*-x86_64"]
  }
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = var.key_name
  
  # PARAMÈTRES CONDITIONNELS
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = var.user_data != "" ? file(var.user_data) : null

  tags = merge(var.tags, {
    Name = var.instance_name
  })
}