#-------------------------
# Global
#-------------------------
region = "eu-west-1"

owner       = "Ricardo Fortune"
project     = "Oanda Algo Trading"
environment = "test" # dev|test|prd

# Suffix for resource names
suffix = "tst"

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
