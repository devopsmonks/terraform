# variable "AWS_ACCESS_KEY" {}
# variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-1"
}
variable "WIN_AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-09ef280df1a6a5330"
    us-west-2 = "ami-03b994b96379e8723"
    eu-west-1 = "ami-09c6f606506004483"
  }
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "../../.ssh/devopsmonks.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "../../.ssh/devopsmonks.pem"
}
variable "INSTANCE_USERNAME" {
  default = "Terraform"
}
variable "INSTANCE_PASSWORD" { }
