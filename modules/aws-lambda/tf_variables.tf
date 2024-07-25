variable "lambda_archive" {
  type        = string
  default     = ""
  description = "Read the lambda archive file from this file and deploy it as the function. If not specified, it will be built on demand."
}

variable "dyndns_version" {
  type        = string
  default     = ""
  description = "If no archive file is specified and the function is built on demand, this variable specifies which version is downloaded and built. If not specified, the most recent release from GitHub is automatically used."
}

variable "hosted_zone_id" {
  type        = string
  description = "AWS Route53 hosted zone id that holds the DNS records we want to keep updated."
}

variable "env_vars" {
  type        = map(any)
  description = "Environment variables for Dyndns server"
}

variable "env" {
  type        = string
  description = "The environment. Must be either 'dev', 'dqs' or 'prod'."

  validation {
    condition     = var.env == "dev" || var.env == "dqs" || var.env == "prod"
    error_message = "The env must be either 'dev', 'dqs' or 'prod'."
  }
}
