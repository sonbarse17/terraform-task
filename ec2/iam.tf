resource "aws_iam_role" "k8s" {
  name = "K8sEC2Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}
resource "aws_iam_policy" "k8s_policy" {
  name        = "K8s-admin"
  description = "full access k8s"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "custom_k8s_full_access" {
  role       = aws_iam_role.k8s.name
  policy_arn = aws_iam_policy.k8s_policy.arn
}


resource "aws_iam_instance_profile" "k8s_profile" {
  name = "K8s-instance-profile"
  role = aws_iam_role.k8s.name
}