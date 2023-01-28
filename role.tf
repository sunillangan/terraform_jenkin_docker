resource "aws_iam_instance_profile" "ec2_profile" {
  name = "jenkins_profile"
  role = aws_iam_role.ec2_iam_role.name
}

resource "aws_iam_role_policy" "ec2_role_policy" {
  name = "ec2_policy"
  role = aws_iam_role.ec2_iam_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
      /*  Action = [
          "ec2:*",
        ]*/
        Action = "*"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "ec2_iam_role" {
  name = "my-jenkin-terraform2"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}