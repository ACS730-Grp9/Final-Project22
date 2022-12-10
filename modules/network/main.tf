provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {
  state = "available"
}

#tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-Vpc"
      env  = var.env
  })  
}


resource "aws_subnet" "public_subnet" {
  count             = length(var.public_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_cidr_blocks[count.index]
  availability_zone = var.zones[count.index]

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-Public-Subnet-${count.index + 1}"
      env  = var.env
  })  
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_cidr_blocks)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_cidr_blocks[count.index]
  availability_zone = var.zones[count.index]

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-Private-Subnet-${count.index + 1}"
      env  = var.env
  })  
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-Igw"
      env  = var.env
  }) 
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-Route-Public-Route-Table"
      env  = var.env
  })   
}

resource "aws_route_table_association" "public_route_table_association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet[0].id
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-NatGw"
      env  = var.env
  })  

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "nat-eip" {
  vpc = true

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-NatGw-Eip"
      env  = var.env
  })  

}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-Route-Private-Route-Table"
      env  = var.env
  })    
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat-gw.id
}

resource "aws_route_table_association" "private_route_table_association" {
  count          = length(aws_subnet.private_subnet[*].id)
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet[count.index].id
}