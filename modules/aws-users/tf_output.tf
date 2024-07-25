output "clients_group_name" {
  description = "The name of the IAM group that holds all the clients of DynDns."
  value       = aws_iam_group.clients.name
}

output "servers_group_name" {
  description = "The name of the IAM group that holds all the servers of DynDns."
  value       = aws_iam_group.servers.name
}

output "clients" {
  description = "Map containing access credentials of all the created client users."
  value = {
    for client in var.clients : client => {
      access_key = aws_iam_access_key.client[client].id
      secret_key = aws_iam_access_key.client[client].secret
    }
  }
}

output "servers" {
  description = "Map containing access credentials of all the created server users."
  value = {
    for server in var.servers : server => {
      access_key = aws_iam_access_key.server[server].id
      secret_key = aws_iam_access_key.server[server].secret
    }
  }
}
