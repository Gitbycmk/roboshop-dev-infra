terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
  }
  backend "s3" {
    bucket = "cmk-remote-state-86s-dev" 
    key = "roboshop-dev-vpc"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}