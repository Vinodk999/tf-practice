provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Terraform-VPC"
    }
}

resource "aws_subnet" "mysubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "Terraform-Subnet"
    }
}

import {
    to = aws_vpc.myvpc
    id = "vpc-0d914fa6204cbf646"
}


import {
    to = aws_subnet.mysubnet
    id = "subnet-029eb7a4174a5d81c"
}