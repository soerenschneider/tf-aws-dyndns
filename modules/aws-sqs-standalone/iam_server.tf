locals {
  server_group_name = "dyndns_server_sqs_${var.env}"
}

resource "aws_iam_group_policy_attachment" "server" {
  policy_arn = aws_iam_policy.sqs_server.arn
  group      = var.servers_group_name
}

resource "aws_iam_policy" "server" {
  name        = local.server_group_name
  description = "Allows pushing messages to the SQS queue"
  policy      = data.aws_iam_policy_document.sqs_server.json
}

data "aws_iam_policy_document" "sqs_server" {
  statement {
    effect = "Allow"
    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage"
    ]
    resources = [
      aws_sqs_queue.dyndns.arn
    ]
  }
}
