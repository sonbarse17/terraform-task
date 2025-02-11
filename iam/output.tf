output "iam_user" {
  value = aws_iam_user.users.name
}

output "iam_group" {
  value = aws_iam_group.ec2_admin.name
}