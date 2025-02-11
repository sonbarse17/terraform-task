resource "aws_iam_group" "ec2_admin" {
  name = var.group
}

resource "aws_iam_user" "users" {
  count = length(var.users)
  name = var.users[count.index]
}

resource "aws_iam_group_membership" "group_add" {
  name  = "add-user-to-group"
  count = length(var.users)
  group = aws_iam_group.ec2_admin.name
  users = [aws_iam_user.users[count.index].name]
}

resource "aws_iam_group_policy_attachment" "policy_attach" {
  group      = aws_iam_group.ec2_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

# resource "aws_iam_role" "k8s" {
#   name = "K8sEC2Role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Effect = "Allow"
#       Principal = {
#         Service = "ec2.amazonaws.com"
#       }
#       Action = "sts:AssumeRole"
#     }]
#   })
# }

# resource "aws_iam_instance_profile" "k8s_profile" {
#   name = "K8s-instance-profile"
#   role = aws_iam_role.k8s.name
# }

