terraform {
  required_version = ">= 0.5.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.58"
    }
  }
}