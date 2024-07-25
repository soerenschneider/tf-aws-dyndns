locals {
  group_name = "dyndns_client_lambda_sqs_${var.env}"
}

resource "aws_iam_group_policy_attachment" "clients" {
  policy_arn = aws_iam_policy.sqs_send_message.arn
  group      = var.clients_group_name
}

resource "aws_iam_policy" "sqs_send_message" {
  name        = local.group_name
  description = "Allows pushing messages to the SQS queue"
  policy      = data.aws_iam_policy_document.sqs.json
}

data "aws_iam_policy_document" "sqs" {
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
