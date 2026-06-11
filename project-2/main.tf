#provide
#vpc creation
#subnet creation
  #public subnet
  #private subnet
  #route table creation
  #internet gateway creation
  #route table association

provide "aws" {
    region = "us-east-1"
}

resoutce "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "VPC-Project-by-terraform"
    }  
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "Public-Subnet-Project-by-terraform"
    }
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false
    tags = {
        Name = "Private-Subnet-Project-by-terraform"
    }
}

resource "aws_route_table" "public-route_table" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name = "Route-Table-Project-by-terraform"
    }
}

resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name = "MyIGW"
    }
}

resource "aws_route" "public-route-to-igw" {
    route_table_id = aws_route_table.public-route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
}

resource "aws_route_table_association" "public-subnet-association" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.public-route_table.id
}

