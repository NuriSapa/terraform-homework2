terraform {
  backend "s3" {
    bucket = "nuriza25"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "log-state"
  }
}
