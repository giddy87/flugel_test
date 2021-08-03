resource "aws_instance" "flugel_web" {
count = var.instance_count
ami = var.ami
instance_type = var.instance_type
key_name = aws_key_pair.ec2_key.key_name
user_data = file("install_nginx.sh")
associate_public_ip_address = false
subnet_id =  aws_subnet.flugel_private.id
vpc_security_group_ids = [aws_security_group.flugel_private_web.id]


tags = {
	Name = "Flugel"
	Instance_details = "flugel_web_server_${count.index +1}" 
	Owner = "InfraTeam"
        Role = "Cluster"
}
}
