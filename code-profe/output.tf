output "ec2_ips" {
  value = aws_instance.victor-ec2.*.public_ip
}
