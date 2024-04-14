provider aws {
    region = var.region

}

resource "aws_instance" "web" {
  ami = var.ami_id
  #ami = ami-0900fe555666598a2 ohio
  instance_type = var.type

  tags = local.common_tags
  count = 1
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  key_name = aws_key_pair.example.key_name
}

variable ami_id {
  description = "Provide ami id"
  default = ""
  type = string
} 

variable type {
  description = "Provide instance type"
  default = ""
  type = string
}

variable region {
  description = "Provide region"
  default = ""
  type = string
}

