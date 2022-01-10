provider "aws" {
  region = var.aws_region
}

# vpc
resource "aws_vpc" "weworld-vpc" {
  cidr_block =  "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "weworld-vpc"
  }
}

# internet gateway that allow user can access to resouces
resource "aws_internet_gateway" "weworld-igw" {
  vpc_id = aws_vpc.weworld-vpc.id

  tags = {
    Name = "weworld-igw"
  }
}

# subnets you have to create a couple subnets every resouce
resource "aws_subnet" "weworld-frontend-1a" {
  vpc_id                  = aws_vpc.weworld-vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "weworld-frontend-1a"
  }
}
resource "aws_subnet" "weworld-frontend-1c" {
  vpc_id                  = aws_vpc.weworld-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "weworld-frontend-1c"
  }
}
resource "aws_subnet" "weworld-backend-1a" {
  vpc_id                  = aws_vpc.weworld-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "weworld-backend-1a"
  }
}
resource "aws_subnet" "weworld-backend-1c" {
  vpc_id                  = aws_vpc.weworld-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "weworld-backend-1c"
  }
}

# route table that contains internet gateway
## create route table
resource "aws_route_table" "weworld-frontend-rtb" {
  vpc_id = aws_vpc.weworld-vpc.id

  route {
    gateway_id = aws_internet_gateway.weworld-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "weworld-frontend-rtb"
  }
}
resource "aws_route_table" "weworld-backend-rtb" {
  vpc_id = aws_vpc.weworld-vpc.id

  route {
    gateway_id = aws_internet_gateway.weworld-igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "weworld-backend-rtb"
  }
}
## attach route table to every subnet
resource "aws_route_table_association" "weworld-frontend-rtb-1a" {
  subnet_id      = aws_subnet.weworld-frontend-1a.id
  route_table_id = aws_route_table.weworld-frontend-rtb.id
}
resource "aws_route_table_association" "weworld-frontend-rtb-1c" {
  subnet_id      = aws_subnet.weworld-frontend-1c.id
  route_table_id = aws_route_table.weworld-frontend-rtb.id
}
resource "aws_route_table_association" "weworld-backend-rtb-1a" {
  subnet_id      = aws_subnet.weworld-backend-1a.id
  route_table_id = aws_route_table.weworld-backend-rtb.id
}
resource "aws_route_table_association" "weworld-backend-rtb-1c" {
  subnet_id      = aws_subnet.weworld-backend-1c.id
  route_table_id = aws_route_table.weworld-backend-rtb.id
}

# security group
## for RDS
resource "aws_security_group" "weworld-rds-sg" {
  # name   = "weworld-rds-sg"
  vpc_id = aws_vpc.weworld-vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "weworld-rds-sg"
  }
}
