variable "aws_region" {
  default = "eu-west-3"
}

variable "key_name" {
  description = "Name of the AWS key pair to use for EC2 instances"
  type        = string
  default     = "yahya"
}

