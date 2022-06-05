#------------------------------------------- 
# Outputs 
#------------------------------------------- 

output "ecs_task_execution_role_arn" { value = module.iam.ecs_task_execution_role_arn }
output "ecs_task_role_arn" { value = module.iam.ecs_task_role_arn }
output "fx_bastion_role_name" { value = module.iam.fx_bastion_role_name }