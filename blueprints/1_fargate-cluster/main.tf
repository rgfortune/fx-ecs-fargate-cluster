#----------------------------------
# ECS Clusters
#----------------------------------

resource "aws_ecs_cluster" "fx" {
  name = var.cluster_name
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = var.common_tags
}

resource "aws_ecs_cluster_capacity_providers" "fx" {

  cluster_name = aws_ecs_cluster.fx.name

  capacity_providers = [var.capacity_provider]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = var.capacity_provider
  }
}