locals {
    vpc_cidr = "10.0.0.0/16"
    public_subnet_cidr = ["10.0.1.0/24"]
    private_subnet_cidr = ["10.0.2.0/24"]
}

data "aws_availability_zones" "azs" {
  state = "available"
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"
  name = local.common_tags.Project
  azs = ["${data.aws_availability_zones.azs.names[0]}", "${data.aws_availability_zones.azs.names[1]}"]
  public_subnets = local.public_subnet_cidr
  private_subnets = local.private_subnet_cidr

  tags = local.common_tags
}
