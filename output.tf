output "public_dns" {
  value = module.compute1.public_dns
}

output "public_ip" {
  value = module.compute1.public_ip
}

output "private_dns" {
  value = module.compute2.private_dns
}

output "private_ip" {
  value = module.compute2.private_ip
}

# output "private_dns" {
#   value = [for k, v in aws_instance.terra_instance : v.private_dns]
# }

# output "private_ip" {
#   value = [for k, v in aws_instance.terra_instance : v.private_ip]
# }

# output "public_ip" {
#   value = [for k, v in aws_instance.terra_instance : v.public_ip]
# }

# # 모든 리소스에 대한 arn 정보 출력
# output "all_arn" {
#   description = "생성된 리소스의 ARN 정보"
#   value = {
#     "vpc" : aws_vpc.terra_vpc.arn,
#     "public_subnets" : aws_subnet.terra_public_subnet.*.arn,
#     "private_subnets" : aws_subnet.terra_private_subnet.*.arn,
#     "instance" : [for k, v in aws_instance.terra_instance : v.arn]
#   }
# }