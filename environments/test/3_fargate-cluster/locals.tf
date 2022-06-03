locals {
  # Common Tags
  common_tags = {
    Owner       = var.owner
    Project     = var.project
    Environment = var.environment
  }

}