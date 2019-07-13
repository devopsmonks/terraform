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
  Name = "Terraform State File Locking"
}
}