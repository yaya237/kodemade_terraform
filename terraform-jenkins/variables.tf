variable "aws_region" {
default = "eu-west-3"
}
 
 variable "public_cidr" {
  default = "10.0.173.0/24"
}

variable "az" {
  default = "eu-west-3a"
}

variable "key_name" {
  description = "Nom du key pair EC2"
  default     = "YacineKey"
}