resource "aws_s3_bucket" "b" {
    bucket = "${var.MYBUCKETNAME}"
    acl = "private"

    tags = {
        Name = "${var.MYBUCKETNAME}"
    }
}
