provider "aws" {
  region     = "us-east-1"
}

resource "aws_vpc" "dev_vpc" {
  cidr_block       = "172.32.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "rm-aws-vpc"
  }
}
