#------------------------------------------------
# Provider
#------------------------------------------------

provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "ecs-fx-test-tfstate"
    key    = "ecs-fx-security_groups.terraform.tfstate"
    region = "us-east-1"
  }
}