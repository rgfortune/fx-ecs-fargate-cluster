#------------------------------------------- 
# Outputs 
#------------------------------------------- 

output "fx_task" { value = aws_security_group.fx_task.id }
output "bastion" { value = aws_security_group.bastion.id }