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
variable "cluster_name" {
  type = string
}
variable "capacity_provider" {
  type = string
}
