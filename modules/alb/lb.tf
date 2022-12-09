resource "aws_lb" "application_load_balancer" {
  name               = "${var.common_name}-LB"
  security_groups    = [aws_security_group.scg_lb.id]
  subnets            = var.public_subnet
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  internal           = false  #tfsec:ignore:aws-elb-alb-not-public
  drop_invalid_header_fields = true
  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-LB"
      env  = var.env
  })
}


resource "aws_lb_listener" "application_load_balancer_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = "80"
  protocol          = "HTTP" #tfsec:ignore:aws-elb-http-not-used

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application_target_group.arn
  }
  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-LB-Listener"
      env  = var.env
  })
}



