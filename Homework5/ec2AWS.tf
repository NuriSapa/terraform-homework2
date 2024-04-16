
# resource "aws_instance" "amazon" {
#   ami           = "ami-0395649fbe870727e"
#   instance_type = var.instance_type 

#   user_data = file ("apache.sh")
#   subnet_id = var.subnet_cider[1].cider

#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
  
# }