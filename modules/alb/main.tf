locals {
  comon_name = "${var.group_name}-${var.env}"
}

resource "aws_lb_target_group" "application_target_group" {
  name        = "${local.comon_name}-targetgroup"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
   health_check {
    interval = 10
    path = "/"
    protocol = "HTTP"
    port = 80
    timeout = 5
    healthy_threshold = 5
    unhealthy_threshold = 2

  }
  vpc_id      = var.vpc_id
  tags = {
    Name = "${local.comon_name}-targetgroup"
    env  = var.env
  }

}

resource "aws_lb" "application_load_balancer" {
  name               = "${local.comon_name}-LB"
  security_groups    = [var.security_groups]
  subnets            = [var.public_subnet,var.private_subnet]
  load_balancer_type = "application"
  ip_address_type = "ipv4"
  internal           = false
  tags = {
    Name = "${local.comon_name}-LB"
    env  = var.env
  }
}


resource "aws_lb_listener" "application_load_balancer_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application_target_group.arn
  }
  tags = {
    Name = "${local.comon_name}-LB-listener"
    env  = var.env
  }
}



