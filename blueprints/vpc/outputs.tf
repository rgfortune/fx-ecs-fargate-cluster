#------------------------------------------- 
# VPC Outputs 
#------------------------------------------- 

output "vpc_id" { value = module.vpc.vpc_id }
output "cidr_block" { value = module.vpc.cidr_block }

output "availability_zones" { value = module.vpc.availability_zones }

output "public_subnets" { value = module.vpc.public_subnets }

output "private_subnets_00" { value = module.vpc.private_subnets_00 }
output "private_subnets_01" { value = module.vpc.private_subnets_01 }
output "private_subnets_02" { value = module.vpc.private_subnets_02 }
