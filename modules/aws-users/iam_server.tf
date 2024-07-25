locals {
  server_group_name = "dyndns_server_${var.env}"
}

resource "aws_iam_group" "servers" {
  name = local.server_group_name
}

resource "aws_iam_user" "server" {
  #checkov:skip=CKV_AWS_273:IAM user needed
  for_each = var.servers

  name = format("%s_%s", local.server_group_name, each.value)
}

resource "aws_iam_group_membership" "servers" {
  #checkov:skip=CKV2_AWS_21:False positive
  #checkov:skip=CKV2_AWS_14:False positive
  name  = local.server_group_name
  group = aws_iam_group.servers.name
  users = [
    for server in var.servers : aws_iam_user.server[server].id
  ]
}

resource "aws_iam_access_key" "server" {
  for_each = var.servers

  user = aws_iam_user.server[each.value].name
}

resource "aws_iam_group_policy_attachment" "clients" {
  policy_arn = aws_iam_policy.server.arn
  group      = aws_iam_group.servers.name
}

resource "aws_iam_policy" "server" {
  name        = "dyndns_server_route53_${var.env}"
  description = "Allows updating host records."
  policy      = data.aws_iam_policy_document.route53_upsert.json
}

data "aws_iam_policy_document" "route53_upsert" {
  statement {
    effect = "Allow"
    actions = [
      "route53:ChangeResourceRecordSets"
    ]
    resources = [
      "arn:aws:route53:::hostedzone/${var.hosted_zone_id}"
    ]
  }
}
