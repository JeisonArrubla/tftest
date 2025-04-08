resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr
  tags = {
    Name = "vpc-ohio"
    name = "test"
    env  = "test"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_ohio.id
  cidr_block              = var.public_subnet
  map_public_ip_on_launch = true # Hacer que a las instancias lanzadas en la subred se les asigne una dirección IP pública

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_ohio.id
  cidr_block = var.private_subnet

  tags = {
    Name = "private-subnet"
  }
}