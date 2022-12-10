data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

locals {
  common_name = "${var.prefix}-${var.env}"
}

module "globalvars" {
  source = "../modules/globalvars"
}

module "vpc-dev" {
  source              = "../modules/network"
  env                 = var.env
  vpc_cidr            = var.vpc_cidr
  public_cidr_blocks  = var.public_subnet_cidrs
  private_cidr_blocks = var.private_subnet_cidrs
  prefix              = module.globalvars.prefix
  default_tags        = module.globalvars.default_tags
  common_name         = local.common_name
}

module "aws_key" {
  source       = "../modules/aws_key"
  key_name     = "${local.common_name}-key"
  key_path     = abspath("../keys/acs_project.pub")
  default_tags = module.globalvars.default_tags
  common_name  = local.common_name  
  env          = var.env
}

module "alb" {
  source                    = "../modules/alb"
  env                       = var.env
  prefix                    = module.globalvars.prefix
  vpc_id                    = module.vpc-dev.vpc_id
  public_subnet             = module.vpc-dev.public_subnet_ids
  private_subnet            = module.vpc-dev.private_subnet_ids
  bastion_security_group_id = module.bastion.bastion_security_group_id
  default_tags              = module.globalvars.default_tags
  common_name               = local.common_name  
}

module "asg" {
  source           = "../modules/asg"
  env              = var.env
  prefix           = module.globalvars.prefix
  target_group_arn = module.alb.target_group
  vpc_id           = module.vpc-dev.vpc_id
  public_subnet    = module.vpc-dev.public_subnet_ids
  private_subnet   = module.vpc-dev.private_subnet_ids
  security_groups  = [module.alb.security_groups]
  min_size         = var.min_size
  max_size         = var.max_size
  instance_type    = var.instance_type
  instance_ami     = data.aws_ami.latest_amazon_linux.id
  key_name         = module.aws_key.key_name
  desired_capacity = var.desired_capacity
  members          = module.globalvars.members
  default_tags     = module.globalvars.default_tags
  common_name      = local.common_name  
  bucket_name      = var.your_bucket_name
}

module "bastion" {
  source            = "../modules/bastion"
  env               = var.env
  prefix            = module.globalvars.prefix
  instance_ami      = data.aws_ami.latest_amazon_linux.id
  key_name          = module.aws_key.key_name
  instance_type     = var.instance_type
  vpc_id            = module.vpc-dev.vpc_id
  bastion_subnet_id = module.vpc-dev.public_subnet_ids[0]
  default_tags      = module.globalvars.default_tags
  common_name       = local.common_name  
}