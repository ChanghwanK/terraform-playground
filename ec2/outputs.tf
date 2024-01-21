output "aws_ec2_arn" {
  value = aws_instance.demo-ec2.arn
}

output "aws_ec2_public_ip" {
  value = aws_instance.demo-ec2.public_ip
}