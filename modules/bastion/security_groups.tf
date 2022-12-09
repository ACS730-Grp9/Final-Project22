resource "aws_security_group" "bastion_ssh" {
  name   = "${var.common_name}-SSH-In-SG"
  description = "Allows SSH traffic."
  vpc_id = var.vpc_id
  egress {
    description = "Allows all traffic out to any destination."
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-egress-sgr
  }

  ingress {
    description = "Allows SSH traffic in from any source"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-ingress-sgr
  }

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-SSH-In-SG"
      env  = var.env
  })  
}