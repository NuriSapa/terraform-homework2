
resource "aws_key_pair" "deployer" {
key_name   = "bastion-key"
public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "homework" {
  bucket_prefix = "kaizen-"

}

resource "aws_s3_bucket" "homework2" {
  bucket = "kaizen-nuriza"

}

import {
  to = aws_s3_bucket.bucket
  id = "my-backet-hw"
  
}

resource "aws_s3_bucket" "bucket" {
   bucket = "my-backet-hw" 
}

import {
  to = aws_s3_bucket.home2
  id = "my-backet-hw2"
  
}
resource "aws_s3_bucket" "home2" {
   bucket = "my-backet-hw2" 
}

#terraform import 'aws_s3_bucket.bucket' my-backet-hw (hw2)

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



  
