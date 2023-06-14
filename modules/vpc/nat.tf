# ----------------------------------------------------------------------------------------------------------------------
# CREATE VPC Nat
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat"
    Environment = var.environment
  }
}

# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.subnets[var.subnets[0]].id

#   tags = {
#     Name = "nat"
#     Environment = var.environment
#   }

#   depends_on = [aws_internet_gateway.igw]
# }