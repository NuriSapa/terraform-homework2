provider aws {
    region = var.region

}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  ami = var.ami_id

  #ami uniq for each region need to pay attention
  instance_type = var.type

}

variable type  {
  description = "Provide instance type"
  default = "t2.micro"
  type = string
}



