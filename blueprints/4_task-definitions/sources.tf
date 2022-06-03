#------------------------------------------------
# IAM State Reference
#------------------------------------------------

data "terraform_remote_state" "iam" {
  backend = "s3"

  # Paths are relative to the calling/root module.
  # {path.module} - making the path relative to the module where the expression exists.

  config = {
    bucket = "ecs-fx-test-tfstate"
    key    = "ecs-fx-iam.terraform.tfstate"
    region = "eu-west-1"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}