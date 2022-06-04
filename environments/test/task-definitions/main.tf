#------------------------------------------------
# Resources
#------------------------------------------------
module "task_definitions" {

  source = "../../../blueprints/task-definitions"

  region = var.region

  # FX Users - Each user map creates a task and SNS topic/subscription
  users = var.users

  common_tags = local.common_tags
}