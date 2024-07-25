variable "clients" {
  type = set(string)
}

variable "servers" {
  type = set(string)
}

variable "hosted_zone_id" {
  type = string
}

variable "deploy_lambda" {
  type    = bool
  default = true
}

variable "lambda_env" {
  type    = map(string)
  default = {}
}

variable "deploy_lambda_sqs" {
  type    = bool
  default = true
}

variable "deploy_lambda_api_gateway" {
  type    = bool
  default = false
}

variable "deploy_sqs_standalone" {
  type    = bool
  default = false
}
