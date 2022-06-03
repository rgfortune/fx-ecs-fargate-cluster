#------------------------------------------- 
# FX Task Security Groups 
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

  tags = {
    Name = "FX-Task"
  }
}
