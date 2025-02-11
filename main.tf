module "iam_create" {
  source = "./iam"
}

module "ec2" {
  source = "./ec2"
}