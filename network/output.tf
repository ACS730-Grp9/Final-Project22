output "public_subnet_ids" {
  value = module.vpc-dev.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc-dev.private_subnet_ids
}

output "internet_gateway_ids" {
  value = module.vpc-dev.internet_gateway_ids
}

output "vpc_id" {
  value = module.vpc-dev.vpc_id
}

output "load_balancer_dns" {
  value = module.alb.load_balancer_access
}

output "bastion_ip" {
  value = module.bastion.bastion_public_ip
}

output "bastion_security_group_id" {
  value = module.bastion.bastion_security_group_id
}