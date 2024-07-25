output "sqs_url" {
  description = "The URL of the created SQS instance."
  value       = aws_sqs_queue.dyndns.url
}

output "sqs_arn" {
  value = aws_sqs_queue.dyndns.arn
}
