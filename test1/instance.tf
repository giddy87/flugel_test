resource "aws_instance" "dev" {
  ami = var.ami
  key_name = aws_key_pair.ec2_key.key_name
  associate_public_ip_address = true
  instance_type = var.instance_type
  tags = var.tags

}

output "public_ip" {
  value = aws_instance.dev.public_ip
}

output "tags" {
  value = aws_instance.dev.tags
}
