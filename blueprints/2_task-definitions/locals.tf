#-------------------------------------
# Database Credentials
#-------------------------------------

data "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = "mongodb_atlas"
}

locals {

  db_credentials = jsondecode(
    data.aws_secretsmanager_secret_version.db_credentials.secret_string
  )

}