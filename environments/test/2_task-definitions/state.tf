#------------------------------------------------
# Provider
#------------------------------------------------

provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "ecs-fx-test-tfstate"
    key    = "ecs-fx-task_definitions.terraform.tfstate"
    region = "eu-west-1"
  }
}