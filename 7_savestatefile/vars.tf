# You can use this URL here at the bottom, "https://cloud-images.ubuntu.com/locator/ec2/" to look up your "AMI-IDs".

# variable "AWS_ACCESS_KEY" {}
# variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-2"
}
variable "AWS_PROFILE" {
  default = "terraform"
}

variable "AMIS" {
  type = "map"
  default = {
    eu-west-1 = "ami-0e52b5f0b50d5c811" # EU Ireland
    eu-west-2 = "ami-082f73b60cd9b99b2" # EU London
    us-east-1 = "ami-00d4e9ff62bc40e03" # US N.virginia
  }
}
