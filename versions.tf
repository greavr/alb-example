terraform {
  required_version = ">= 1.1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.00"
    }
    time = {
      source = "hashicorp/time"
      version = "~> 0.7.2"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.3.1"
    }
  }
}