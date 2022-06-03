#------------------------------------------------
# VPC
#
# Module Sources:
#
# git::ssh://git@bitbucket_rgfortune/rgfortune/terraform-vpc_basic-module.git
# git::ssh://git@bitbucket_rgfortune/rgfortune/terraform-vpc-module.git
#
# github.com/rgfortune/terraform-basic-vpc-module
#------------------------------------------------


module "vpc" {
  source = "github.com/rgfortune/terraform-basic-vpc-module"

  # VPC Variables
  vpc_name = var.vpc_name
  cidr     = var.cidr

  # Number of availabilty zones to use
  availability_zones_count = var.availability_zones_count

  # Specify the names of your public/private subnets (Application Stack Tiers)
  public_subnet_names  = var.public_subnet_names  # Module currently only supports one
  private_subnet_names = var.private_subnet_names # Can support up to four

  # Specify the number NAT GWs you want
  # Default to 1 in a public subnet.
  # Setting to 2 or equal to the total number of availability zones in use will provide HA
  nat_gw_count = var.nat_gw_count

  # Common Tags
  common_tags = var.common_tags
}