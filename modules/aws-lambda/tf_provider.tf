terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.59.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "3.4.3"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }

    time = {
      source  = "hashicorp/time"
      version = "0.12.0"
    }
  }
}
