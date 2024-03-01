# Crear un security group que permita conexiones SSH, HTTPS y HTTP
# Cambiar el ID de VPC por la de ustedes o dejar por default
resource "aws_security_group" "victor-sg" {
  name_prefix = "${var.nombre}-SG"
  vpc_id      = "vpc-08e2d879e4087daea"

  # los parametros ingress permiten el inteso desde internet a los puertos del EC2
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # los parametros egress permiten el accedo del EC2 a internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# deben cambiar la ami y la subnet por la suya o dejar por default
resource "aws_instance" "victor-ec2" {
  ami                         = "ami-0c7217cdde317cfec"
  instance_type               = "t2.micro"
  count                       = var.cantidad
  associate_public_ip_address = true
  subnet_id                   = "subnet-0d1c893a888480b1a"
  # el parametro de key_name lo cambiamos por el nombre de la nuestra
  key_name = "key-victor"

  vpc_security_group_ids = [
    aws_security_group.victor-sg.id
  ]

  tags = {
    Name = "${var.nombre}-vivas-${count.index + 1}"
  }
}