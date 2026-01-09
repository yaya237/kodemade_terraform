variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "az" {
  description = "Availability Zone"
  type        = string
}

variable "public_cidr" {
  description = "Public subnet CIDR"
  type        = string
  default     = ""
}


variable "igw_id" {
  description = "Internet Gateway ID"
  type        = string
  default     = ""
}
