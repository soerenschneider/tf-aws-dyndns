output "api_gateway_invoke_url" {
  description = "The URL of the API Gateway to invoke."
  value       = aws_api_gateway_deployment.dyndns-server_v1.invoke_url
}
