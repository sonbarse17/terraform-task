variable "group" {
  description = "The name of the IAM group."
  type        = string
}

variable "users" {
  description = "List of IAM user names to be added to the group."
  type        = list(string)
  default     = []
}