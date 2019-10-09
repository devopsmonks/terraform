terraform {
  backend "s3" {
    encrypt = true
    #bucket = "devopsmonks_terraform-state-storage"
    bucket         = "chakra-encrypted-files-new"
    dynamodb_table = "devopsmonks_terraform-state-lock"
    key            = "../6_userdata/terraform.tfstate"
    region         = "eu-west-1"
    # access_key = "<aws_access_key>"
    # secret_key = "<aws_secret_key>"
  }
}
