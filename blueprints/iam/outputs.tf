#------------------------------------------- 
# Outputs 
#------------------------------------------- 

output "ecs_task_execution_role_arn" { value = aws_iam_role.ecs_task_execution_role.arn }
output "ecs_task_role_arn" { value = aws_iam_role.ecs_task_role.arn }
output "fx_bastion_role_name" { value = aws_iam_instance_profile.fx_bastion.name }
