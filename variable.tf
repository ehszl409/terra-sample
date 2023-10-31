variable "aws_region" {
  type        = string
  description = "AWS REGIONS CODE. (DEFAULT: AP-NORTHEAST-2)"
  default     = "ap-northeast-2"
  validation {
    condition     = contains(["ap-southeast-1"], var.aws_region)
    error_message = "사용 가능한 리전은 ap-southeast-1 입니다.."
  }
}
variable "aws_access_key" {
  type        = string
  description = "AWS CLI ACCESS KEY"
  sensitive = true
}
variable "aws_secret_key" {
  type        = string
  description = "AWS CLI SECRET KEY"
  sensitive = true
}