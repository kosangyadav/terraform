# first generate a rsa/ed25519 private and public key for key-pair...
# ssh-keygen -t rsa -b 4096 <./file/path>

# a resource block for using a local public key
resource "aws_key_pair" "local_key" {
  key_name   = "local-public-key"
  public_key = file("test-rsa.pub")
}

# a resource block for using default vpc
resource "aws_default_vpc" "default" {

}

# a resource block for creating a new security group via terraform
resource "aws_security_group" "local_sg" {
  name        = "tls-sg"
  description = "a security group created by terraform"
  vpc_id      = aws_default_vpc.default.id
  tags = {
    Name = "tls-sg"
  }
}

# multiple resource blocks for adding multiple inbound rules of security group (ingress can also be used).

resource "aws_vpc_security_group_ingress_rule" "allow_443_ip4" {
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"
  # cidr_ipv6         = "::/0"
  security_group_id = aws_security_group.local_sg.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_443_ip6" {
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
  # cidr_ipv4   = "0.0.0.0/0"
  cidr_ipv6         = "::/0"
  security_group_id = aws_security_group.local_sg.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_80_ip4" {
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"
  # cidr_ipv6         = "::/0"
  security_group_id = aws_security_group.local_sg.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_80_ip6" {
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  # cidr_ipv4   = "0.0.0.0/0"
  cidr_ipv6         = "::/0"
  security_group_id = aws_security_group.local_sg.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_22_ip4" {
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"
  # cidr_ipv6         = "::/0"
  security_group_id = aws_security_group.local_sg.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_22_ip6" {
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
  # cidr_ipv4   = "0.0.0.0/0"
  cidr_ipv6         = "::/0"
  security_group_id = aws_security_group.local_sg.id
}

# a single resource block for allowing all traffic going outside from instance as outbound rule of security group (egress can also be used).

resource "aws_vpc_security_group_egress_rule" "allow_outside_all_ip4" {
  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
  # cidr_ipv6         = "::/0"
  security_group_id = aws_security_group.local_sg.id
}

resource "aws_vpc_security_group_egress_rule" "allow_outside_all_ip6" {
  ip_protocol = "-1"
  # cidr_ipv4   = "0.0.0.0/0"
  cidr_ipv6         = "::/0"
  security_group_id = aws_security_group.local_sg.id
}



# now, a final resource block for the aws ec2 instance spin up...

resource "aws_instance" "tf-instance" {
  for_each = {
    "micro instance" : "t2.micro"
    "small instance" : "t2.small"
  }
  ami = var.ami-id
  # instance_type   = var.ec2-type
  instance_type   = each.value
  key_name        = aws_key_pair.local_key.key_name
  security_groups = [aws_security_group.local_sg.name]
  root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }
  tags = {
    # Name = "terraform-server"
    Name = each.key
  }
}

# command login in to instance without console, with the help of outputs...
# ssh -i test-rsa ec2-user@ec2-43-207-106-220.ap-northeast-1.compute.amazonaws.com
# ssh -i <private-key> <username>@<public-dns>
