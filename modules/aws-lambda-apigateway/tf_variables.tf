variable "lambda_function_name" {
  type        = string
  description = "The name of the lambda function to invoke."
}

variable "lambda_invoke_arn" {
  type        = string
  description = "Invoke ARN of the lambda function"
}

variable "env" {
  type        = string
  description = "The environment. Must be either 'dev', 'dqs' or 'prod'."

  validation {
    condition     = var.env == "dev" || var.env == "dqs" || var.env == "prod"
    error_message = "The env must be either 'dev', 'dqs' or 'prod'."
  }
}
