# # outputs need to see after the creation of ec2 instance via terraform
#
# output "instance-id" {
#   value = [
#     for tf-instance in aws_instance.tf-instance : tf-instance.id
#   ]
# }
#
# output "instance-host-id" {
#   value = aws_instance.tf-instance.host_id
# }
#
# output "instance-state" {
#   value = aws_instance.tf-instance.instance_state
# }
#
# output "instance-key-name" {
#   value = aws_instance.tf-instance.key_name
# }
#
# output "instance-private-dns" {
#   # value = aws_instance.tf-instance.private_dns
#   value = [
#     for tf-instance in aws_instance.tf-instance : tf-instance.private_dns
#   ]
# }
#
# output "instance-private-ip" {
#   value = aws_instance.tf-instance.private_ip
# }
#
output "instance-public-dns" {
  # value = aws_instance.tf-instance.private_dns
  value = [
    for tf-instance in aws_instance.tf-instance : tf-instance.public_dns
  ]
}
#
# output "instance-public-ip" {
#   # value = aws_instance.tf-instance.public_ip
#   value = [
#     for tf-instance in aws_instance.tf-instance : tf-instance.public_ip
#   ]
#
# }
#
# output "instance-security-groups" {
#   value = aws_instance.tf-instance.security_groups
# }

