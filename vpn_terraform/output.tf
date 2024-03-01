output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "ssh_security_group_pub_id" {
  description = "The ID of the SSH security group (public)"
  value       = aws_security_group.allow_ssh_pub.id
}

output "ssh_security_group_priv_id" {
  description = "The ID of the SSH security group (private)"
  value       = aws_security_group.allow_ssh_priv.id
}