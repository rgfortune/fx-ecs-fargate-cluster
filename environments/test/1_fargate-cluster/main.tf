#------------------------------------------------
# Resources
#------------------------------------------------
module "fargate_cluster" {

  source = "../../../blueprints/1_fargate-cluster"

  cluster_name = var.cluster_name

  common_tags = local.common_tags
}