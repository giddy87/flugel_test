# Elastic ip
resource "aws_eip" "nat_eip" {
  vpc = true
}

# Nat GW
resource "aws_nat_gateway" "flugel_nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.flugel_private.id
  depends_on    = [aws_internet_gateway.flugel_igw]
tags = {
Name = "Flugel"
Owner = "InfraTeam"
}
}

# NAT route table
resource "aws_route_table" "flugel_private_route" {
  vpc_id = aws_vpc.flugel.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.flugel_nat.id
  }

  tags = {
    Name = "Flugel"
    Owner = "InfraTeam"
  }
}

# route associations private
resource "aws_route_table_association" "flugel_private_assoc" {
  subnet_id      = aws_subnet.flugel_private.id
  route_table_id = aws_route_table.flugel_private_route.id
}
