#------------------------------------------------
# Resources
#------------------------------------------------
module "bastion" {

  source = "../../../blueprints/bastion"

  bastion_type = var.bastion_type
  key_name     = var.key_name

  common_tags = local.common_tags
}