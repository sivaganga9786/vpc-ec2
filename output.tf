output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_instance_ids" {
  value = module.ec2.instance_ids
}

output "public_subnets" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private[*].id
}


