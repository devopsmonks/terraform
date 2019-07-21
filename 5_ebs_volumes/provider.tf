provider "aws" {
    region = "${var.AWS_REGION}"
    profile = "terraform"
    # profile = "${var.AWS_PROFILE}"
}
