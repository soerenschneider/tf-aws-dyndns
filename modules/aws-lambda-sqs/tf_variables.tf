variable "clients_group_name" {
  type        = string
  description = "The name of the IAM group that holds all the clients interacting with DynDns."
}

variable "lambda_arn" {
  type        = string
  description = "ARN of the lambda function"
}

variable "lambda_log_group_arn" {
  type        = string
  description = "ARN of the log group to write logs to."
}

variable "lambda_role_name" {
  type        = string
  description = "Name of the lambda role to attach policies to."
}

variable "env" {
  type        = string
  description = "The environment. Must be either 'dev', 'dqs' or 'prod'."

  validation {
    condition     = var.env == "dev" || var.env == "dqs" || var.env == "prod"
    error_message = "The env must be either 'dev', 'dqs' or 'prod'."
  }
}
