# ----------------------------------------------------------------------------------------------------------------------
# CREATE VPC Nat
# ----------------------------------------------------------------------------------------------------------------------
# ## Create Public Internet Route
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat.id
#   }

#   tags = {
#     Name = "All"
#   }

#   depends_on = [ aws_nat_gateway.nat ]
# }

# ## Link Route to Subnets
# resource "aws_route_table_association" "subnets" {
#     for_each = aws_subnet.subnets

#     subnet_id      = each.value.id
#     route_table_id = aws_route_table.public.id

#     depends_on = [ aws_subnet.subnets ]
# }