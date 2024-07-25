resource "aws_sqs_queue" "dyndns" {
  #checkov:skip=CKV_AWS_27:Queue does not contain sensitive data
  name                      = "dyndns-lambda-${var.env}"
  delay_seconds             = 0    # Delay time for messages to be available for processing
  message_retention_seconds = 3600 # Time in seconds that messages are retained in the queue

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 3
  })
}

resource "aws_sqs_queue" "dlq" {
  #checkov:skip=CKV_AWS_27:Queue does not contain sensitive data
  name                      = "dyndns-lambda-dlq-${var.env}"
  message_retention_seconds = 86400
}

resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = aws_sqs_queue.dyndns.arn
  function_name    = var.lambda_arn
  batch_size       = 1
  enabled          = true
}

data "aws_iam_policy_document" "lambda" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      var.lambda_log_group_arn
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
    ]
    resources = [aws_sqs_queue.dyndns.arn]
  }
}

resource "aws_iam_policy" "sqs" {
  name        = "dyndns-lambda-sqs-${var.env}"
  path        = "/"
  description = "IAM policy for reading from SQS"
  policy      = data.aws_iam_policy_document.lambda.json
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = var.lambda_role_name
  policy_arn = aws_iam_policy.sqs.arn
}
