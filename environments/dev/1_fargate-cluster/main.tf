#------------------------------------------------
# Resources
#------------------------------------------------
module "fargate_cluster" {

  source = "../../../blueprints/services/1_fargate-cluster"

  env          = var.env
  cluster_name = var.cluster_name
  cluster_tag  = var.cluster_tag
}