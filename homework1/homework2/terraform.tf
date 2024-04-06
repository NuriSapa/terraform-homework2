provider "aws" {
    region = "eu-central-1"
  
}

resource "aws_key_pair" "deployer" {
key_name   = "bastion-key"
public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example" {
  bucket_prefix = "kaizen-"

}

resource "aws_s3_bucket" "example" {
  bucket = "kaizen-nuriza"

}

# import {
#   to = aws_s3_bucket.bucket
#   id = "mybacket-24"
  
# }

resource "aws_s3_bucket" "bucket" {
   bucket = "mybacket24" 
}

resource "aws_s3_bucket" "bucket" {
   bucket = "mybacket-24" 
}

#terraform import 'aws_s3_bucket.bucket' mybacket24

resource "aws_iam_user" "lb" {
  for_each = toset([
    "jenny",
    "rose",
    "lisa",
    "jisoo"
    ])
  name = each.key
}

resource "aws_iam_group" "loop" {
  name = "blackpink"
}

resource "aws_iam_group_membership" "team" {
  name = "blackpink"

  users = [
    for i in aws_iam_user.lb : i.name 
    ]

  group = aws_iam_group.loop.name
}



  
