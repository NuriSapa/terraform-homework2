provider "aws" {
  region = var.region
}

resource "aws_vpc" "kaizen" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cider[0].cider

  map_public_ip_on_launch = true
  availability_zone       = "${var.region}b"

 
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cider[1].cider


  map_public_ip_on_launch = true
  availability_zone       = "${var.region}b"

  
}

resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = var.subnet_cider[2].cider
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}c"
 
}

resource "aws_subnet" "private2" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = var.subnet_cider[3].cider
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}c"
 
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "homework5_igw"
  }
}


# Create the public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.kaizen.id
  tags = {
    Name = "public_rt"
  }
}



# Create the private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.kaizen.id
  tags = {
    Name = "private_rt"
  }
}

# Create a route in the public route table for internet access
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id # Assuming you have already created an internet gateway named "example"
}

resource "aws_route" "private_internet_access" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id # Assuming you have already created an internet gateway named "example"
}

resource "aws_route_table_association" "public_assos" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_rt.id


}

resource "aws_route_table_association" "public2_assos" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_rt.id


}