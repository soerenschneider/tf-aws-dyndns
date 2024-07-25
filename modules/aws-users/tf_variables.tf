variable "clients" {
  type        = set(string)
  description = "A list of usernames that are created to interact as a client with DynDns resources."
}

variable "servers" {
  type        = set(string)
  description = "A list of usernames that are created to interact as a server with DynDns resources."
}

variable "hosted_zone_id" {
  type        = string
  description = "AWS Route53 hosted zone id that holds the DNS records we want to keep updated."
}

variable "env" {
  type = string

  validation {
    condition     = var.env == "dev" || var.env == "dqs" || var.env == "prod"
    error_message = "The role must be either 'dev' or 'prod'."
  }
}
