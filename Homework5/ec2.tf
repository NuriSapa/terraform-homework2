
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "Kaizen" {

  ami = data.aws_ami.ubuntu.id

  #aim uniq for each region need to pay attention
  instance_type = var.instance_type

  tags = {
    Name = "kaizen"
  }
  subnet_id = aws_subnet.public1.id


  #subnet_id = ""
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  user_data = file("ubuntu.sh")

}



# * we using to get the all ip's eather we can put [1 or 2 or 0]
#will provide all information. we can output any information


