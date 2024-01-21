
variable "region" {
  default     = "ap-northeast-2"
  description = "AWS Region"
}

variable "key_name" {
  default     = "terraform-demo-key"
  description = "YOUR AWS KEY PAIR NAME"
}

variable "instance-type" {
  default     = "t2.micro"
  description = "AWS EC2 Instance Type"
}

variable "tag_name" {
  default = "terraform-demo"
  description = "Tag Name"
}