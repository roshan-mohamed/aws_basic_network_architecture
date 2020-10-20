resource "aws_route_table" "public" {
  vpc_id = aws_vpc.dev_vpc.id

route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.igw.id
 }

  tags = {
    Name = "rm-aws-RT-public"
  }
}

resource "aws_route_table_association" "associate_public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "rm-aws-RT-private"
  }
}

resource "aws_route_table_association" "associate_private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
