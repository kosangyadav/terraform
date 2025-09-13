
# hcl script to initialize a s3 bucket on aws using variables...

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name
  tags = {
    name       = var.tagname
    envirnment = var.envirnment
  }
}
