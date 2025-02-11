module "iam_create" {
  source = "./iam"
  group  = "ec2_admin"
  users  = ["sushant", "mayur"]
}

module "ec2" {
  source = "./ec2"
}
