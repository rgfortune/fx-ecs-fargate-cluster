#------------------------------------------------
# Resources
#------------------------------------------------
module "security_groups" {

  source = "../../../blueprints/security_groups"

  common_tags = local.common_tags

}