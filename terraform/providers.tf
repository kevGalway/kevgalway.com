# Special provider for creating ACM certs as they must be provisioned in us-east-1 to work with cloudfront.
provider "aws" {
  region = "us-east-1"
  alias = "use1"
  profile = "personal"
}

provider "aws" {
  region = var.region
  profile = "personal"
}