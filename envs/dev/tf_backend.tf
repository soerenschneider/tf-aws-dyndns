# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket  = "soerenschneider-terraform"
    key     = "aws-sqs-dyndns-dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
