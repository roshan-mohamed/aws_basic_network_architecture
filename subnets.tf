resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "172.32.1.0/24"

  tags = {
    Name = "rm-aws-priv"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "172.32.2.0/24"

  tags = {
    Name = "rm-aws-pub"
  }
}
