#------------------------------------------------
# Variables
#------------------------------------------------

variable "region" {
  type        = string
  description = "Region"
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
variable "bastion_type" {
  type = string
}
variable "key_name" {
  type = string
}
