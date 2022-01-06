terraform {
  #Everything in this block is optional but it is recommended to have this block
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.27"
    }
  }
}

provider "aws" {
  #you can provide multiple provider names here
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ami_id.id
  instance_type = var.aws_instance_type
  count = 2
  user_data     = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd
                systemctl enable httpd
                echo "<h1> Hello World </h1>" > /var/www/html/index.html
                EOF
  tags = {
    name  = "App-Server-${count.index}"
    stage = "Dev"
  }
}

#data could not be substituted in variables/tfvars file
data "aws_ami" "ami_id" {
  owners = ["self"]
  filter {
    name   = "name"
    values = ["M*"]
  }
}

