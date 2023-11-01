terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Create a VPC
module "vpc" {
  source       = "github.com/ehszl409/tf_aws_vpc.git"
  cidr_network = "192.168.0.0/16"
  az_count     = 1
  private_subnet = [
    "192.168.0.0/24"
  ]
  public_subnet = [
    "192.168.1.0/24"
  ]
}

# module "subnet" {
#   source     = "./aws_subnet/"
#   cidr_block = "192.168.0.0/24"
#   vpc_id     = module.vpc.vpc_id
#   is_public  = true
#   az         = "ca-central-1a"
# }

module "keypair" {
  source   = "github.com/ehszl409/tf_aws_keypair.git"
  key_name = "terra_gen_key_bo_06"
}

module "compute1" {
  source    = "./aws_ec2"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet[0].id
  az        = module.vpc.public_subnet[0].availability_zone
  key_pair  = module.keypair.name
}

module "compute2" {
  source     = "./aws_ec2"
  vpc_id     = module.vpc.vpc_id
  subnet_id  = module.vpc.private_subnet[0].id
  az         = module.vpc.private_subnet[0].availability_zone
  key_pair   = module.keypair.name
  src_sg     = module.compute1.src_sg
  depends_on = [module.compute1]
}

# # Create a Private Subnet
# resource "aws_subnet" "terra_private_subnet" {
#   count      = 2
#   vpc_id     = aws_vpc.terra_vpc.id
#   cidr_block = "10.0.${count.index + 2}.0/24"
#   # 짝수 번호는 가용영역 a 로 홀수 번호는 가용영역 b 로 설정
#   availability_zone       = "${var.aws_region}${count.index % 2 == 0 ? "a" : "b"}"
#   map_public_ip_on_launch = false
#   tags = {
#     Name      = "terra_private_subnet${count.index + 1}"
#     createdBy = "terraform"
#   }
# }