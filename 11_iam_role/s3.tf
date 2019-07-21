resource "aws_s3_bucket" "b" {
    bucket = "chakra-c29df1"
    acl = "private"

    tags = {
        Name = "chakra-c29df1"
    }
}
