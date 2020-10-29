module "tfe_network_lb" {
  source = "../../"

  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids

  lb_internal = false

  name_prefix = var.name_prefix
  common_tags = var.common_tags
}