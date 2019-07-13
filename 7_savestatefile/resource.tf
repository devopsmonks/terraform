terraform {
  backend "s3" {
    encrypt=true
    bucket = "devopsmonks_terraform-state-storage"
    dynamodb_table = "devopsmonks_terraform-state-lock"
    key    = "state-lock-storage.keypath"
    region = "eu-west-1"
    # access_key = "<aws_access_key>"
    # secret_key = "<aws_secret_key>"
  }
}