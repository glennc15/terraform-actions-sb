terraform {

  required_providers {
    aws = {
      version = "~> 5.0"
    }
  }

  required_version = "~> 1.7"

  backend "s3" {
    bucket = "online-resume-backend-tf-state"
    key = "terraform-actions-sb/terraform-state"
    region = "us-east-1"
  }

}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example-bucket" {
}