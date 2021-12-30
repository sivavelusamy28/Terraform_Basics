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
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
  tags = {
    name = "App-Server01"
    stage = "Dev"
  }
  
}