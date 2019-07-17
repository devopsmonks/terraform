variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AWS_PROFILE" {
  default = "terraform"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "../../.ssh/devopsmonks.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "../../.ssh/devopsmonks.pem"
}