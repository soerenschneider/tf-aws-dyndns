locals {
  client_group_name = "dyndns_client_sqs_${var.env}"
}

resource "aws_iam_group" "clients" {
  name = local.client_group_name
}

resource "aws_iam_user" "client" {
  #checkov:skip=CKV_AWS_273:IAM user needed
  for_each = var.clients

  name = format("%s_%s", local.client_group_name, each.value)
}

resource "aws_iam_group_membership" "clients" {
  name  = local.client_group_name
  group = aws_iam_group.clients.name
  users = [
    for client in var.clients : aws_iam_user.client[client].id
  ]
}

resource "aws_iam_access_key" "client" {
  for_each = var.clients

  user = aws_iam_user.client[each.value].name
}
