<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.59.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.59.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_deployment.dyndns-server_v1](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_integration.dyndns-server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_method.dyndns-server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_method_settings.path_specific](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/api_gateway_method_settings) | resource |
| [aws_api_gateway_resource.dyndns-server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_rest_api.dyndns-server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_stage.dyndns-server_v1](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/api_gateway_stage) | resource |
| [aws_lambda_permission.api_gateway_permission](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/lambda_permission) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | The environment. Must be either 'dev', 'dqs' or 'prod'. | `string` | n/a | yes |
| <a name="input_lambda_arn"></a> [lambda\_arn](#input\_lambda\_arn) | ARN of the lambda function | `string` | n/a | yes |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | The name of the lambda function to invoke. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_gateway_invoke_url"></a> [api\_gateway\_invoke\_url](#output\_api\_gateway\_invoke\_url) | The URL of the API Gateway to invoke. |
<!-- END_TF_DOCS -->