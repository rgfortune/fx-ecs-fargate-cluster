#------------------------------------------------
# Data Sources
#------------------------------------------------

data "aws_ami" "linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#------------------------------------------------
# VPC Module State Reference
#------------------------------------------------

data "terraform_remote_state" "vpc" {
  backend = "s3"

  # Paths are relative to the calling module.
  # Making it relative to the root module for readability

  config = {
    bucket = "ecs-fx-test-tfstate"
    key    = "ecs-fx-vpc.terraform.tfstate"
    region = "us-east-1"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}

#------------------------------------------------
# Security Groups State Reference
#------------------------------------------------

data "terraform_remote_state" "security_groups" {
  backend = "s3"

  # Paths are relative to the calling/root module.
  # {path.module} - making the path relative to the module where the expression exists.

  config = {
    bucket = "ecs-fx-test-tfstate"
    key    = "ecs-fx-security_groups.terraform.tfstate"
    region = "us-east-1"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}