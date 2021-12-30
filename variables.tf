#This file can be of any name
variable "aws_ami" {
  description = "AMI image name"
  #default     = "ami-0ed9277fb7eb570c9"
  type = string
}

variable "aws_instance_type" {
  description = "Size of the EC2 instance"
  type        = string
  #default     = "t2.micro"
}