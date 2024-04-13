provider "aws" {
    region = "us-west-2"
  
}

resource "aws_instance" "web" {
  ami           = "ami-089313d40efd067a9"
  instance_type = "t3.micro"

  tags = local.common_tags

  count = 3

  user_data = file ("Apache.sh")
 
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  key_name = aws_key_pair.example.key_name
}

output web-1 {
  value = aws_instance.web[0].public_ip
}

output web-2 {
  value = aws_instance.web[1].public_ip
}

output web-3 {
  value = aws_instance.web[2].public_ip
}

