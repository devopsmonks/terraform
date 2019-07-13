data "aws_caller_identity" "current" {}

data "aws_iam_user" "current" {
    user_name  = "terraform_user"
}
data "aws_availability_zones" "available" {}

output "aws_account_id" {
value = "${data.aws_caller_identity.current.account_id}"
}
output "aws_iam_user" {
value = "${data.aws_iam_user.current.user_id}"
}
output "aws_availability_zones" {
value = "${data.aws_availability_zones.available.zone_ids}"
}
