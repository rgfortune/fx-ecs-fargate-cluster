#------------------------------------------------
# Variables
#------------------------------------------------

variable "env" {
  type        = string
  description = "e.g. dev"
}
variable "cluster_name" {
  type = string
}
variable "cluster_tag" {
  type = string
}
variable "region" {
  type        = string
  description = "e.g. eu-west-2"
}