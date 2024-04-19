terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.38.0"
    }
  }

  required_version = "~> 1.2"

   backend "s3" {
       bucket = "online-resume-backend-tf-state"
       key    = "/terraform-actions-sb/terraform-state"
       region = "east-us-1"
   }

}

provider "aws" {
  version = "~>3.0"
  region  = "east-us-1"
}

resource "aws_s3_bucket" "s3Bucket" {
     bucket = "my-website-87654"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::my-website-87654/*",
         "principal" : "*"
      }
    ]
  }
EOF

   website {
       index_document = "index.html"
   }
}