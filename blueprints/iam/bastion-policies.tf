#------------------------------------------
# Bastion Role
#------------------------------------------

resource "aws_iam_role" "bastion" {
  name = "Bastion"
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
data "aws_iam_policy_document" "bastion" {
  statement {
    sid    = "BastionAccess"
    effect = "Allow"
    actions = [
      "s3:*",
      "ssm:*"
    ]
    resources = ["*"]
  }
}

# Create bastion IAM policy
resource "aws_iam_policy" "bastion" {
  name        = "bastion"
  path        = "/"
  description = "Bastion policy"
  policy      = data.aws_iam_policy_document.bastion.json
}

resource "aws_iam_role_policy_attachment" "bastion" {
  role       = aws_iam_role.bastion.name
  policy_arn = aws_iam_policy.bastion.arn
}

resource "aws_iam_role_policy_attachment" "bastion_cwlogs" {
  role       = aws_iam_role.bastion.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}
