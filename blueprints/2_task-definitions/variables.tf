#------------------------------------------------
# Variables
#------------------------------------------------
variable "region" {
  type        = string
  description = "e.g. eu-west-1"
}
variable "env" {
  type        = string
  description = "Environment"
}
variable "users" {
  type = map(any)
}
