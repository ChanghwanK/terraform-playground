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

locals {
  common_tags = {
    Name        = "terraform-demo-ec2"
    Environment = "demo"
  }
}

resource "aws_key_pair" "demo-ec-key" {
  public_key = file("~/.ssh/id_rsa.pub")
  key_name   = var.key_name
}


resource "aws_instance" "demo-ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance-type
  key_name      = aws_key_pair.demo-ec-key.key_name

  tags = merge({
    Name        = var.tag_name
    Description = "Terraform Demo EC2"
  }, local.common_tags)
}