variable "clients_group_name" {
  type        = string
  description = "The name of the IAM group that holds all the clients interacting with DynDns."
}

variable "servers_group_name" {
  type        = string
  description = "The name of the IAM group that holds all the servers interacting with DynDns."
}

variable "env" {
  type        = string
  description = "The environment. Must be either 'dev', 'dqs' or 'prod'."

  validation {
    condition     = var.env == "dev" || var.env == "dqs" || var.env == "prod"
    error_message = "The env must be either 'dev', 'dqs' or 'prod'."
  }
}
