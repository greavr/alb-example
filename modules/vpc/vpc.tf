# ----------------------------------------------------------------------------------------------------------------------
# CREATE VPC & Subnets
# ----------------------------------------------------------------------------------------------------------------------
## Main Network
resource "aws_vpc" "main" {
  cidr_block = var.network-cidr
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc-name
    Environment = var.environment
  }
}

## Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
    Environment = var.environment
  }

  depends_on = [ aws_vpc.main ]
}

## Subnets
resource "aws_subnet" "subnets" {
  vpc_id            = aws_vpc.main.id

  for_each = {for a_subnet in var.subnets: a_subnet.zone => a_subnet}

  cidr_block        = each.value.cidr
  availability_zone = each.value.zone

  tags = {
    "Name" = "private-${each.value.zone}"
    "Environment" = var.environment
  }

  depends_on = [ aws_vpc.main ]
}