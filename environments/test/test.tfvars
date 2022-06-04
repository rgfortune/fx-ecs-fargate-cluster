#-------------------------
# Global
#-------------------------
region = "us-east-1"

owner       = "Ricardo Fortune"
project     = "Oanda Algo Trading"
environment = "test" # dev|test|prd

# Suffix for resource names
suffix = "tst"

#-------------------------
# VPC
#-------------------------
vpc_name = "FX"
cidr     = "10.70.0.0/16"

# Number of availabilty zones to use
availability_zones_count = 2

# The names of the public/private subnets (Application Stack Tiers)
public_subnet_names  = ["public"]  # Module currently only supports one
private_subnet_names = ["private"] # Can support up to four

# Specify the number NAT GWs you want
# Default to 1 in a public subnet.
# Setting to 2 or equal to the total number of availability zones in use will provide HA
nat_gw_count = 0

#-------------------------
# ECS Cluster
#-------------------------

cluster_name      = "FX"
capacity_provider = "FARGATE_SPOT" # FARGATE|FARGATE_SPOT


#-------------------------
# Task Definitions
#-------------------------

# FX Users - Each user map creates a task and SNS topic/subscription
users = {
  rfortune = "ricardo.g.fortune@gmail.com"
}
