data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["arm64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

resource "aws_instance" "this" {
  ami = data.aws_ami.this.id
  
  
  user_data = file("apache.sh")
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = "t4g.nano"
  tags = {
    Name = "Amazon"
  }
}