variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "AWS_PROFILE" {
  default = "terraform"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "../../.ssh/devopsmonks.pem"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "../../.ssh/devopsmonks.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}
