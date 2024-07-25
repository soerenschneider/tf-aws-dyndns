resource "aws_sqs_queue" "dyndns" {
  #checkov:skip=CKV_AWS_27:Queue does not contain sensitive data
  name                      = "dyndns_${var.env}"
  delay_seconds             = 0     # Delay time for messages to be available for processing
  message_retention_seconds = 86400 # Time in seconds that messages are retained in the queue
}
