provider "aws" {
    region ="us-east-1"
}

resource "aws_instance" "ec2" {
    ami= "ami-00e801948462f718a"
    instance_type = "t2.micro"
    count = 3
}
 