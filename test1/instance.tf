resource "aws_instance" "dev" {
  ami = var.ami
  key_name = aws_key_pair.ec2_key.key_name
  associate_public_ip_address = true
  instance_type = var.instance_type
  tags = {
    Name = "Flugel"
    Owner = "InfraTeam"
  }
}

