# # output "private_ip_address" {
# #   value = aws_instance.terra_instance[1].private_dns
# # }

# output "private_dns" {
#   value = [for k, v in aws_instance.terra_instance : v.private_dns]
# }
# output "private_ip" {
#   value = [for k, v in aws_instance.terra_instance : v.private_ip]
# }
# output "public_ip" {
#   value = [for k, v in aws_instance.terra_instance : v.public_ip]
# }

# output "all_arn" {
#   description = "ARN"
#   value = {
#     "vpc" : aws_vpc.terra_vpc.arn,
#     "public_subnets" : aws_subnet.terra_public_subnet.*.arn,
#     "private_subnets" : aws_subnet.terra_private_subnet.*.arn,
#     "instance" : [for k, v in aws_instance.terra_instance : v.arn]
#   }
# }

