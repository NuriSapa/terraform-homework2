# terraform-homework4 
in the case of HW 4  why we using .tfvars files is because we are working in difirent AZ. If i want to switch easily from one AZ to different: 
1- need to creat files with name.tfvars and run in terminal 
#terraform apply -var-file name.tfvars ( the same for other comand destroy) Make sure to have key pair in AZ and VPC 
2- Tfvars file also needs in the case if we dont wont to push the information to GitHub 
3- in main terraform file we need to use variables 