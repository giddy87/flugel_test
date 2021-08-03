# Flugel VPC
resource "aws_vpc" "flugel" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = var.tags
}

# Subnets
resource "aws_subnet" "flugel_public" {
  vpc_id                  = aws_vpc.flugel.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.az_a
  tags = var.tags
}


resource "aws_subnet" "flugel_private" {
  vpc_id                  = aws_vpc.flugel.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = var.az_b

  tags = var.tags
}
# Internet GW
resource "aws_internet_gateway" "flugel_igw" {
  vpc_id = aws_vpc.flugel.id

  tags = {
    Name = "Flugel"
    Owner = "InfraTeam"
  }
}

# route tables
resource "aws_route_table" "flugel_route_public" {
  vpc_id = aws_vpc.flugel.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.flugel_igw.id
  }

  tags = var.tags
}

# route associations public
resource "aws_route_table_association" "flugel_public_assoc" {
  subnet_id      = aws_subnet.flugel_public.id
  route_table_id = aws_route_table.flugel_route_public.id
}

# Security Groups
resource "aws_security_group" "flugel_web_sg" {
name = "allow_web"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "flugel_private_web" {
name = "allow_web"
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
