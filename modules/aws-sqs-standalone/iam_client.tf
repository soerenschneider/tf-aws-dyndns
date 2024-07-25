locals {
  client_group_name = "dyndns_client_sqs_${var.env}"
}

resource "aws_iam_group_policy_attachment" "client" {
  policy_arn = aws_iam_policy.sqs_server.arn
  group      = var.clients_group_name
}

resource "aws_iam_policy" "sqs_server" {
  name        = local.client_group_name
  description = "Allows pushing messages to the SQS queue"
  policy      = data.aws_iam_policy_document.sqs_client.json
}

data "aws_iam_policy_document" "sqs_client" {
  statement {
    effect = "Allow"
    actions = [
      "sqs:SendMessage"
    ]
    resources = [
      aws_sqs_queue.dyndns.arn
    ]
  }
}
