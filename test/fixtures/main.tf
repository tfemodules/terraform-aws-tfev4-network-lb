module "tfe_network_lb" {
  source = "../../"

  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids

  lb_internal = false

  name_prefix = var.name_prefix
  common_tags = var.common_tags
}

# describe the lb target groups since inspec does not yet have a resource to get them

data "aws_lb_target_group" "lb_tg_80" {
  arn  = module.tfe_network_lb.lb_tg_80_arn
}

data "aws_lb_target_group" "lb_tg_443" {
  arn  = module.tfe_network_lb.lb_tg_443_arn
}

data "aws_lb_target_group" "lb_tg_8800" {
  arn  = module.tfe_network_lb.lb_tg_8800_arn
}