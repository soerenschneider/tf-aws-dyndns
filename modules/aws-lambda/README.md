<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.59.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 3.4.3 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.1 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.2 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.59.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.3 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.2 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.lambda_log_group](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.lambda_logging](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.dyndns-server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda_logs](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.dyndns-server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/lambda_function) | resource |
| [local_file.checkout_git_repo](https://registry.terraform.io/providers/hashicorp/local/2.5.1/docs/resources/file) | resource |
| [null_resource.checkout_and_build](https://registry.terraform.io/providers/hashicorp/null/3.2.2/docs/resources/resource) | resource |
| [time_sleep.wait_60_seconds](https://registry.terraform.io/providers/hashicorp/time/0.12.0/docs/resources/sleep) | resource |
| [aws_iam_policy_document.lambda](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/data-sources/iam_policy_document) | data source |
| [http_http.github_latest_release](https://registry.terraform.io/providers/hashicorp/http/3.4.3/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dyndns_version"></a> [dyndns\_version](#input\_dyndns\_version) | If no archive file is specified and the function is built on demand, this variable specifies which version is downloaded and built. If not specified, the most recent release from GitHub is automatically used. | `string` | `""` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment. Must be either 'dev', 'dqs' or 'prod'. | `string` | n/a | yes |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | Environment variables for Dyndns server | `map(any)` | n/a | yes |
| <a name="input_hosted_zone_id"></a> [hosted\_zone\_id](#input\_hosted\_zone\_id) | AWS Route53 hosted zone id that holds the DNS records we want to keep updated. | `string` | n/a | yes |
| <a name="input_lambda_archive"></a> [lambda\_archive](#input\_lambda\_archive) | Read the lambda archive file from this file and deploy it as the function. If not specified, it will be built on demand. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_arn"></a> [lambda\_arn](#output\_lambda\_arn) | ARN of the Lambda function |
| <a name="output_lambda_function_name"></a> [lambda\_function\_name](#output\_lambda\_function\_name) | The name of the created Lambda function. |
| <a name="output_lambda_invoke_arn"></a> [lambda\_invoke\_arn](#output\_lambda\_invoke\_arn) | Invoke ARN of the Lambda function |
| <a name="output_lambda_log_group_arn"></a> [lambda\_log\_group\_arn](#output\_lambda\_log\_group\_arn) | ARN of the Cloudwatch log group Lambda logs to. |
| <a name="output_lambda_role_name"></a> [lambda\_role\_name](#output\_lambda\_role\_name) | Name of the Lambda role. |
<!-- END_TF_DOCS -->