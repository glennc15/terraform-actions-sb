terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "online-resume-backend-tf-state"
    key = "terraform.tfstate"
    region = "us-east-1"
  }

}




provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example-bucket" {
}