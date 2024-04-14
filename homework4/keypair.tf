resource "aws_key_pair" "example" {
  key_name   = "Homework-Nuriza"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = local.common_tags
}
