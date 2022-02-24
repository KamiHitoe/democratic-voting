# global config
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "ap-northeast-1"
}

# # vpc
# resource "aws_vpc" "democratic-vpc" {
#   cidr_block           = "10.0.0.0/16"
#   enable_dns_support   = true
#   enable_dns_hostnames = true

#   tags = {
#     Name = "democratic-vpc"
#   }
# }

# # subnets you have to create a couple of subnets every resouce
# resource "aws_subnet" "democratic-frontend-1a" {
#   vpc_id                  = aws_vpc.democratic-vpc.id
#   cidr_block              = "10.0.0.0/24"
#   availability_zone       = "ap-northeast-1a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "democratic-frontend-1a"
#   }
# }
# resource "aws_subnet" "democratic-frontend-1c" {
#   vpc_id                  = aws_vpc.democratic-vpc.id
#   cidr_block              = "10.0.1.0/24"
#   availability_zone       = "ap-northeast-1c"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "democratic-frontend-1c"
#   }
# }
# resource "aws_subnet" "democratic-backend-1a" {
#   vpc_id                  = aws_vpc.democratic-vpc.id
#   cidr_block              = "10.0.2.0/24"
#   availability_zone       = "ap-northeast-1a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "democratic-backend-1a"
#   }
# }
# resource "aws_subnet" "democratic-backend-1c" {
#   vpc_id                  = aws_vpc.democratic-vpc.id
#   cidr_block              = "10.0.3.0/24"
#   availability_zone       = "ap-northeast-1c"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "democratic-backend-1c"
#   }
# }

