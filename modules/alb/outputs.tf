output "load_balancer_access" {
  value = aws_lb.application_load_balancer.dns_name
}
output "target_group" {
  value = aws_lb_target_group.application_target_group.arn
}

output "security_groups" {
  value = aws_security_group.scg_lb.id
}
