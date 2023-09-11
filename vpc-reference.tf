# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block           =
  instance_tenancy     =
  enable_dns_support   =
  enable_dns_hostnames =

  tags = {
    Name = "${}-VPC"
  }
}

# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id =

  tags = {
    Name = "${}-IGW"
  }
}

# Use Data Source to get all Avalablility Zones in the region
data "aws_availability_zones" "available_zones" {}

# Create Public Subnet AZ1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  =
  cidr_block              =
  availability_zone       =
  map_public_ip_on_launch =

  tags = {
    Name =
  }
}

# Create Public Subnet AZ2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = 
  cidr_block              = 
  availability_zone       = 
  map_public_ip_on_launch =

  tags = {
    Name = 
  }
}

# Create Public Route Table and add Public Route
resource "aws_route_table" "public_route_table" {
  vpc_id =

  route {
    cidr_block =
    gateway_id =
  }

  tags = {
    Name =
  }
}

# Associate Public Subnet AZ1 to "Public Route Table"
resource "aws_route_table_association" "public_subnet_az1_rt_association" {
  subnet_id      =
  route_table_id =
}

# Associate Public Subnet AZ2 to "Public Route Table"
resource "aws_route_table_association" "public_subnet_2_rt_association" {
  subnet_id      =
  route_table_id =
}

# Create Private Subnet AZ1
resource "aws_subnet" "private_subnet_az1" {
  vpc_id                  =
  cidr_block              =
  availability_zone       =
  map_public_ip_on_launch =

  tags = {
    Name =
  }
}

# Create Private Subnet AZ2
resource "aws_subnet" "private_subnet_az2" {
  vpc_id                  =
  cidr_block              =
  availability_zone       =
  map_public_ip_on_launch =

  tags = {
    Name =
  }
}