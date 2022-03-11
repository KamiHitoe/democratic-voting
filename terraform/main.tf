# global config
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}

# vpc
resource "aws_vpc" "democratic-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "democratic-vpc"
  }
}

# subnets you have to create a couple of subnets every resouce
resource "aws_subnet" "democratic-frontend-1a" {
  vpc_id                  = aws_vpc.democratic-vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "democratic-frontend-1a"
  }
}
resource "aws_subnet" "democratic-frontend-1c" {
  vpc_id                  = aws_vpc.democratic-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "democratic-frontend-1c"
  }
}
resource "aws_subnet" "democratic-backend-1a" {
  vpc_id                  = aws_vpc.democratic-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "democratic-backend-1a"
  }
}
resource "aws_subnet" "democratic-backend-1c" {
  vpc_id                  = aws_vpc.democratic-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "democratic-backend-1c"
  }
}

# internet gateway that allows user access to resouces in public subnet
resource "aws_internet_gateway" "democratic-igw" {
  vpc_id = aws_vpc.democratic-vpc.id

  tags = {
    Name = "democratic-igw"
  }
}

# route table that contains internet gateway
resource "aws_route_table" "democratic-frontend-rtb" {
  vpc_id = aws_vpc.democratic-vpc.id

  route {
    gateway_id = aws_internet_gateway.democratic-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "democratic-frontend-rtb"
  }
}
resource "aws_route_table" "democratic-backend-rtb" {
  vpc_id = aws_vpc.democratic-vpc.id

  route {
    gateway_id = aws_internet_gateway.democratic-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "democratic-backend-rtb"
  }
}
## attach route table to every subnet
resource "aws_route_table_association" "democratic-frontend-rtb-1a" {
  subnet_id      = aws_subnet.democratic-frontend-1a.id
  route_table_id = aws_route_table.democratic-frontend-rtb.id
}
resource "aws_route_table_association" "democratic-frontend-rtb-1c" {
  subnet_id      = aws_subnet.democratic-frontend-1c.id
  route_table_id = aws_route_table.democratic-frontend-rtb.id
}
resource "aws_route_table_association" "democratic-backend-rtb-1a" {
  subnet_id      = aws_subnet.democratic-backend-1a.id
  route_table_id = aws_route_table.democratic-backend-rtb.id
}
resource "aws_route_table_association" "democratic-backend-rtb-1c" {
  subnet_id      = aws_subnet.democratic-backend-1c.id
  route_table_id = aws_route_table.democratic-backend-rtb.id
}


# add EIP
# add NAT-gateway?

