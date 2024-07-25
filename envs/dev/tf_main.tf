locals {
  env = basename(abspath(path.module))
}

module "users" {
  source         = "../../modules/aws-users"
  env            = local.env
  clients        = var.clients
  servers        = var.servers
  hosted_zone_id = var.hosted_zone_id
}

module "lambda" {
  count = var.deploy_lambda ? 1 : 0

  source         = "../../modules/aws-lambda"
  env            = local.env
  env_vars       = var.lambda_env
  hosted_zone_id = var.hosted_zone_id
}

module "lambda-sqs" {
  count = var.deploy_lambda_sqs ? 1 : 0

  source               = "../../modules/aws-lambda-sqs"
  env                  = local.env
  clients_group_name   = module.users.clients_group_name
  lambda_arn           = module.lambda[0].lambda_arn
  lambda_role_name     = module.lambda[0].lambda_role_name
  lambda_log_group_arn = module.lambda[0].lambda_log_group_arn
}

module "lambda-apigateway" {
  count = var.deploy_lambda_api_gateway ? 1 : 0

  source               = "../../modules/aws-lambda-apigateway"
  env                  = local.env
  lambda_invoke_arn    = module.lambda[0].lambda_invoke_arn
  lambda_function_name = module.lambda[0].lambda_function_name
}

module "sqs" {
  count = var.deploy_sqs_standalone ? 1 : 0

  source             = "../../modules/aws-sqs-standalone"
  env                = local.env
  clients_group_name = module.users.clients_group_name
  servers_group_name = module.users.servers_group_name
}

module "client_credentials" {
  source      = "../../modules/vault-credentials"
  path_prefix = "env/${local.env}/dyndns"
  role        = "client"
  credentials = nonsensitive(module.users.clients)
  metadata = {
    env = local.env
  }
}

module "server_credentials" {
  source      = "../../modules/vault-credentials"
  path_prefix = "env/${local.env}/dyndns"
  role        = "server"
  credentials = nonsensitive(module.users.servers)
  metadata = {
    env = local.env
  }
}
