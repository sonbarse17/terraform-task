resource "aws_instance" "demo" {
  ami                  = "ami-0005ee01bca55ab66"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.k8s_profile.name
  tags = {
    Name = "demo"
  }
}
