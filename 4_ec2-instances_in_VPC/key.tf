resource "aws_key_pair" "devopsmonks" {
  key_name = "devopsmonks"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
