#------------------------------------------------
# Variables
#------------------------------------------------

variable "cluster_name" {
  type        = string
  description = "Cluster name"
}
variable "common_tags" {
  type = map(any)
}
