#-------------------------
# Global
#-------------------------
region = "us-east-1"

owner       = "Ricardo Fortune"
project     = "Oanda Algo Trading"
environment = "dev" # dev|test|prd

# Suffix for resource names
suffix = "dev"

#-------------------------
# ECS Cluster
#-------------------------

cluster_name = "FX"


#-------------------------
# Task Definitions
#-------------------------

# FX Users - Each user map creates a task and SNS topic/subscription
users = {
  rfortune = "ricardo.g.fortune@gmail.com"
}
