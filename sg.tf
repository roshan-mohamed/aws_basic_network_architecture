resource "aws_security_group" "allow_tls_pub" {
  name        = "allow_tls_pub"
  description = "Allow TLS inbound traffic"
  # vpc_id      = aws_vpc.dev_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.dev_vpc.cidr_block]
  }

# Not a good practice to keep CIDR open. point it to specific ip. This is just for demo purpose.
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "allow_ssh_priv" {
  name        = "allow_ssh_priv"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.dev_vpc.id

  ingress {
    description = "SSH from public subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.32.2.0/24"]
  }

  tags = {
    Name = "allow_tls"
  }
}
