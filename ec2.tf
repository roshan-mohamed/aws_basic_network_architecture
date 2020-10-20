resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.public.id
  allocation_id = aws_eip.lb.id
}

resource "aws_instance" "public" {
  ami             = "ami-0947d2ba12ee1ff75"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public.id
  key_name        = "terra"
  security_groups = [
       "${aws_security_group.allow_tls_pub.id}"
   ]
}

resource "aws_eip" "lb" {
  instance = aws_instance.public.id
  vpc      = true

  depends_on = [aws_internet_gateway.igw]
}
