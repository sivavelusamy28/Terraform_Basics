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
  tags = {
    name  = "App-Server"
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

output "aws_instance_from_data_source" {
  value = data.aws_ami.ami_id
}