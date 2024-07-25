output "api_gateway_url" {
  value = var.deploy_lambda_api_gateway ? module.lambda-apigateway[0].api_gateway_invoke_url : ""
}

output "lambda_sqs_url" {
  value = var.deploy_lambda_sqs ? module.lambda-sqs[0].sqs_url : ""
}

output "sqs_standalone_url" {
  value = var.deploy_sqs_standalone ? module.sqs[0].sqs_url : ""
}
