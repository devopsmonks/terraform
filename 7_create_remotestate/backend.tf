### example backend 

# terraform {
#  backend “s3” {
#  key = path/to/my/key
#  region = us-east-1
#  bucket = "unique-name-terraform-state-file-storage"
#  dynamodb_table = "terraform-state-locking"
#  encrypt = true # Optional, S3 Bucket Server Side Encryption
#  }
# }