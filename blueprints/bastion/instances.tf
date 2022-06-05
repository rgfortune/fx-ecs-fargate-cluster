#----------------------------------
# Bastion
#----------------------------------

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.linux.id
  instance_type               = var.bastion_type
  key_name                    = var.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.public_subnets[0]["id"]
  iam_instance_profile        = data.terraform_remote_state.iam.outputs.fx_bastion_role_arn
  vpc_security_group_ids      = [data.terraform_remote_state.security_groups.outputs.bastion]
  associate_public_ip_address = true

  lifecycle {
    ignore_changes = [
      associate_public_ip_address
    ]
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = "20"
  }

  #user_data = file("${path.module}/scripts/userdata.tpl")

  tags = merge(var.common_tags, {
    Name        = "bastion"
    Description = "Bastion Instance"
    Role        = "Bastion"
  })

}
