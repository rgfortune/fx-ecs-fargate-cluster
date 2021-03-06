#------------------------------------------------
# Resources
#------------------------------------------------
module "fargate_cluster" {

  source = "../../../blueprints/fargate-cluster"

  cluster_name      = var.cluster_name
  capacity_provider = var.capacity_provider

  common_tags = local.common_tags
}