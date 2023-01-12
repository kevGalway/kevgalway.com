terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }
}

# Default provider for resource creation
provider "aws" {
  region  = "eu-west-1"
  profile = "personal"
}

# Provider required in useast1 for cloudfront, SSLM Certificate
provider "aws" {
  alias   = "useast1"
  region  = "us-east-1"
  profile = "personal"
}

module "website" {
  source  = "InterweaveCloud/s3-cloudfront-static-website/aws"

  resource_uid   = ""
  domain_name    = "kevgalway.com"
  hosted_zone_id = "Z38AGPNT7Q4LWP"
  profile        = "personal"

#  sync_directories = [{
#    local_source_directory = "../_site/"
#    s3_target_directory    = ""
#  }]

  providers = {
    aws.useast1 = aws.useast1
  }
}