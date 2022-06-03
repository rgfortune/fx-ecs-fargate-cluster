#------------------------------------------------
# Variables
#------------------------------------------------

variable "cluster_name" {
  type        = string
  description = "Cluster name"
}
variable "capacity_provider" {
  type = string
}
variable "common_tags" {
  type = map(any)
}
