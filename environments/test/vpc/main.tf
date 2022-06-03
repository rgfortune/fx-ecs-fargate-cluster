#------------------------------------------------
# Resources
#------------------------------------------------

module "vpc" {
  source = "../../../blueprints/vpc"

  # VPC Variables
  vpc_name = var.vpc_name
  cidr     = var.cidr

  # Number of availabilty zones to use
  availability_zones_count = var.availability_zones_count

  # The names of the public/private subnets (Application Stack Tiers)
  public_subnet_names  = var.public_subnet_names  # Module currently only supports one
  private_subnet_names = var.private_subnet_names # Can support up to four

  # Specify the number NAT GWs you want
  # Default to 1 in a public subnet.
  # Setting to 2 or equal to the total number of availability zones in use will provide HA
  nat_gw_count = var.nat_gw_count

  # Common Tags
  common_tags = local.common_tags

}