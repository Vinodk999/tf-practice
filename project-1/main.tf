provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0fdfb4d987b63ae72"
    instance_type = "t2.medium"
    security_groups = ["default"]
    root_block_device {
        volume_size = 30
        volume_type = "gp3"
        delete_on_termination = true
    }
    key_name = "jenkins-login"
    user_data = file("jenkins-server.sh")
    tags = {
        Name = "Admin-Server"
    }
}

output "Public_IP" {
    value = aws_instance.ec2.public_ip
}