# variables required to create ec2 instance via terraform

variable "ami-id" {
  default     = "ami-07faa35bbd2230d90"
  type        = string
  description = "ami id of amazon linux OS for ec2 instance"
}

variable "instance-type" {
  default     = "t2.micro"
  type        = string
  description = "ec2 instance type under free tier"
}

variable "instance-name" {
  default     = "server-by-tf"
  type        = string
  description = "a random name for ec2 instance"
}
