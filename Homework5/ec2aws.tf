resource "aws_instance" "amazon" {
  ami = var.ec2_types[1].ami_id
  
  
  user_data = file("apache.sh")
  subnet_id = aws_subnet.public2.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = var.ec2_types[1].instance_type
  tags = {
    Name = "Amazon"
  }
}