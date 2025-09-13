# minimal code to create an ec2 instance via terraform...

resource "aws_instance" "tf-instance" {
  ami           = var.ami-id
  instance_type = var.instance-type

  tags = {
    Name = var.instance-name
  }
}
