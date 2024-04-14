provider aws {
    region = var.region 
}

resource "aws_vpc" "kaizen" {
  cidr_block = var.vpc_cider
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cider[0].cider

  map_public_ip_on_launch = true
  availability_zone = "${var.region}b"

    tags = {
    Name = var.subnet_cider[0].subnet_name
  }
}


resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cider[1].cider


  map_public_ip_on_launch = true
  availability_zone = "${var.region}b"

    tags = {
    Name = var.subnet_cider[1].subnet_name
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cider[2].cider
   map_public_ip_on_launch = true
  availability_zone = "${var.region}c"
  tags = {
    Name = var.subnet_cider[2].subnet_name
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_cider[2].cider
   map_public_ip_on_launch = true
  availability_zone = "${var.region}d"
  tags = {
    Name = var.subnet_cider[2].subnet_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "homework5_igw"
  }
}