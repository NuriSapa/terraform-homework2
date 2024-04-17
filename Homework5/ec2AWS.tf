
resource "aws_instance" "Amazon" {
  ami           = "ami-0395649fbe870727e"
  instance_type = var.instance_type 

 tags = {
    Name = "amazon"
  }
  user_data = file ("apache.sh")
  subnet_id = aws_subnet.public2.id

  vpc_security_group_ids = [aws_security_group.allow_tls.id]

} 

