#------------------------------------------------
# Variables
#------------------------------------------------

variable "rfortune_count" {
  type    = number
  default = 1
}
variable "region" {
  type        = string
  description = "e.g. eu-west-2"
}
variable "env" {
  type        = string
  description = "Environment"
}
