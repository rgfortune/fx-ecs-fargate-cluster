#------------------------------------------------
# Variables
#------------------------------------------------
variable "region" {
  type        = string
  description = "e.g. eu-west-1"
}
variable "users" {
  type = map(any)
}
variable "common_tags" {
  type = map(any)
}
