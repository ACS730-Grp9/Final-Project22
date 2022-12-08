resource "aws_key_pair" "aws_key" {
  key_name   = var.key_name
  public_key = file("${var.key_path}")
}
