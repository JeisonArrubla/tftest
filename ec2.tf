resource "aws_instance" "public_instance" {
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.public_instance_sg.id]

  provisioner "local-exec" {
    when    = create
    command = "echo Instancia creada con la IP ${aws_instance.public_instance.public_ip}"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo Instancia ${self.public_ip} destruida"
  }
}
