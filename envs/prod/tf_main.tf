locals {
  env = basename(abspath(path.module))
}

module "sqs" {
  source      = "../../modules/aws-sqs-standalone"
  env         = local.env
  clients     = var.clients
  servers     = var.servers
  hosted_zone = var.hosted_zone_id
}

module "client_credentials" {
  source        = "../../modules/vault-credentials"
  path_prefix   = "env/${local.env}/dyndns"
  database_name = "clients"
  credentials   = nonsensitive(module.sqs.clients)
  metadata = {
    env = local.env
  }
}

module "server_credentials" {
  source        = "../../modules/vault-credentials"
  path_prefix   = "env/${local.env}/dyndns"
  database_name = "servers"
  credentials   = nonsensitive(module.sqs.servers)
  metadata = {
    env = local.env
  }
}
