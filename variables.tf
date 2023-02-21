variable "ami_id" {
  description = "ami_id"
  type        = string
  default     = "ami-0d03b1ad793d7ac93"
}

variable "port" {
  description = "port"
  default     = 80
}

variable "aws_region" {
  description = "region"
  default     = "us-east-2"
}