resource "aws_security_group" "scg_lb" {
  name   = "${local.comon_name}-HTTP-In"
  vpc_id = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [var.bastion_security_group_id]    
  }

  tags = {
    Name = "${local.comon_name}-security-group"
    env  = var.env
  }
}