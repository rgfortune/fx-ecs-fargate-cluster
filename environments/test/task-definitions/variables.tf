#------------------------------------------------
# Variables
#------------------------------------------------

variable "region" {
  type        = string
  description = "e.g. eu-west-2"
}
variable "owner" {
  type        = string
  description = "e.g. John Public"
}
variable "project" {
  type        = string
  description = "e.g. Demo"
}
variable "environment" {
  type        = string
  description = "Environment"
}
variable "suffix" {
  type        = string
  description = "Suffix for resource names"
}
variable "users" {
  type = map(any)
}
