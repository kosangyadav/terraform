variable "ami-id" {
  type        = string
  default     = "ami-07faa35bbd2230d90"
  description = "ami id for ec2 instance"
}

variable "ec2-type" {
  type        = string
  default     = "t2.micro"
  description = "type for ec2 instance"
}
