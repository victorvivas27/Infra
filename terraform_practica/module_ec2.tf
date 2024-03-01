module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"
  name                   = "grupo-x-maquinavirtual"
  instance_count         = 2
  ami                    = "ami-04505e74c0741db8d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.ssh_security_group.this_security_group_id]
  subnet_ids             = [ aws_subnet.my-subnet.id ]
  tags = {
    Terraform   = "true"
    Environment = "dev"
 }
}


module "ssh_security_group" {
  source      = "terraform-aws-modules/security-group/aws//modules/ssh"
  version     = "~> 3.0"
  name        = "ssh-server"
  description = "Grupo de seguridad para server ssh y puerto ssh (22)abiertos"
  vpc_id      = aws_default_vpc.shared-vpc.id
  ingress_cidr_blocks = ["172.31.0.0/16"]
}
