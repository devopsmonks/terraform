resource "aws_s3_bucket" "tf-state-storage" {
    bucket = "devopsmonks-terraform-state-storage"
    acl    = "private"
    versioning {
      enabled = true
    }
    lifecycle {
      prevent_destroy = true
    }
    tags = {
    Name        = "Terraform State File"
    Environment = "Dev"
    }
}
# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "devopsmonks-terraform-state-lock"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
attribute {
    name = "LockID"
    type = "S"
  }
tags = {
  Name = "tfstate locking"
}
}


#By executing above you have created s3 bucket and dynamod db table, but your Terraform state will still be stored locally.

#To configure Terraform to store the state in your S3 bucket (with encryption and locking), you need to add a backend configuration to your Terraform code. 
#This is configuration for Terraform itself, so it lives within a terraform block

# in case if you are getting access denied error, it's because terraform takes deafult profile of your terminal,
# you need to override this in your terminal by executing 'export AWS_PROFILE=<your profile name>'

# terraform {
#   backend "s3" {
#     encrypt=true
#     bucket = "devopsmonks-terraform-state-storage"
#     dynamodb_table = "devopsmonks-terraform-state-lock"
#     key    = "global/s3/terraformstate.tfstate"
#     region = "eu-west-1"
#   }
# }