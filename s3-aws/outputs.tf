# declaring outputs for s3_bucket like id and other...

output "s3_id" {
  value = aws_s3_bucket.s3_bucket.id
}

output "s3_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_domain_name
}

output "s3_hosted_zone_id" {
  value = aws_s3_bucket.s3_bucket.hosted_zone_id
}
