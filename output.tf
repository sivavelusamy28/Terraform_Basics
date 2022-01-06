output "aws_ec2_ip" {
  description = "public ip of the EC2 instance"
  value       = aws_instance.app_server[*].public_ip
}

output "aws_ec2_ami" {
  description = "AMI of the EC2 instance"
  value       = aws_instance.app_server[*].ami
}