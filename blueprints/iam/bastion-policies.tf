#------------------------------------------
# Bastion Role
#------------------------------------------

resource "aws_iam_role" "fx_bastion" {
  name = "FX-Bastion"
  path = "/"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "ec2.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

# Bastion policy document
data "aws_iam_policy_document" "fx_bastion" {
  statement {
    sid    = "FXBastionAccess"
    effect = "Allow"
    actions = [
      "s3:*",
      "ssm:*"
    ]
    resources = ["*"]
  }
}

# Create bastion IAM policy
resource "aws_iam_policy" "fx_bastion" {
  name        = "FX-Bastion"
  path        = "/"
  description = "FX Bastion policy"
  policy      = data.aws_iam_policy_document.fx_bastion.json
}

resource "aws_iam_role_policy_attachment" "fx_bastion" {
  role       = aws_iam_role.fx_bastion.name
  policy_arn = aws_iam_policy.fx_bastion.arn
}

resource "aws_iam_role_policy_attachment" "fx_bastion_cwlogs" {
  role       = aws_iam_role.fx_bastion.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}
