resource "aws_security_group" "bastion_ssh" {
  name   = "${var.common_name}-SSH-In-SG"
  vpc_id = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-SSH-In-SG"
      env  = var.env
  })  
}