#------------------------------------------------
# Variables
#------------------------------------------------

variable "bastion_type" {
  type        = string
  description = "Instance type"
}
variable "key_name" {
  type        = string
  description = "e.g. my-key"
}
variable "common_tags" {
  type = map(any)
}
