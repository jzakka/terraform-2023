terraform {
  cloud {
    organization = "og-1-jzakka"

    workspaces {
      name = "ws-1"
    }
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example"
  }
}

resource "aws_subnet" "example_subnet" {
  vpc_id = aws_vpc.example.id

  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "example-vpc-1"
  }
}