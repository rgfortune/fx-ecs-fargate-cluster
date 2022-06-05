#------------------------------------------- 
# FX Task Security Group
#------------------------------------------- 

resource "aws_security_group" "fx_task" {
  name        = "FX-Task"
  description = "Allow HTTP(S) access to FX tasks"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name        = "FX"
    Description = "FX Task"
  })

}

#-------------------------------------------
# Bastion Security Group
#-------------------------------------------

resource "aws_security_group" "bastion" {
  name        = "Bastion"
  description = "Allow SSH access to bastion"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name        = "Bastion"
    Description = "Bastion Instance"
    Role        = "Bastion"
  })

}
