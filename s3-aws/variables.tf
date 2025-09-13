# declaring variables for s3_bucket like name and tags(name & envirnment)

variable "s3_bucket_name" {
  default     = "test-bucket-made-via-tf"
  type        = string
  description = "just a random name for s3-bucket"
}

variable "tagname" {
  default     = "test-bucket"
  type        = string
  description = "just a random name for s3-bucket"
}

variable "envirnment" {
  default     = "dev"
  type        = string
  description = "name of the envirnment"
}
