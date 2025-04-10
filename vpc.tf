resource "aws_vpc" "ohio_vpc" {
  cidr_block = var.ohio_cidr
  tags = {
    Name = "vpc-ohio"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.ohio_vpc.id
  cidr_block              = var.subnets_cidr["public_subnet"]
  map_public_ip_on_launch = true # Hacer que a las instancias lanzadas en la subred se les asigne una dirección IP pública

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.ohio_vpc.id
  cidr_block = var.subnets_cidr["private_subnet"]

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ohio_vpc.id

  tags = {
    Name = "ohio-vpc-igw"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.ohio_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-custom-route-table"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "public_instance_sg" {
  description = "Permitir el trafico entrante SSH y TODO el trafico de salida"
  vpc_id      = aws_vpc.ohio_vpc.id

  ingress {
    description = "SSH a traves de Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_sg]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # Se aplica a todos los protocolos
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "public-instance-sg"
  }
}
