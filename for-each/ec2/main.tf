data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical의 AWS Marketplace 계정 ID
}

variable "instance_tags" {
  description = "A map of instance tags"
  type = map(object({
    Name        = string
    Environment = string
  }))
  default = {}
}

resource "aws_instance" "pg-ec2-instance" {
  for_each      = var.instance_tags
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = each.value
}