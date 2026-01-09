variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "sg_id" {
  description = "Security Group ID"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Associate public IP address to the instance"
  type        = bool
  default     = false
}

variable "user_data" {
  description = "Path to user_data script (empty = no user_data)"
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to the instance"
  type        = map(string)
  default     = {
    Owner = "yacine"
  }
}
