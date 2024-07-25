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
| [aws_iam_group_policy_attachment.clients](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.sqs](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.sqs_send_message](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.lambda_logs](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_event_source_mapping.sqs_trigger](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/lambda_event_source_mapping) | resource |
| [aws_sqs_queue.dlq](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.dyndns](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/sqs_queue) | resource |
| [aws_iam_policy_document.lambda](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sqs](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_clients_group_name"></a> [clients\_group\_name](#input\_clients\_group\_name) | The name of the IAM group that holds all the clients interacting with DynDns. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment. Must be either 'dev', 'dqs' or 'prod'. | `string` | n/a | yes |
| <a name="input_lambda_arn"></a> [lambda\_arn](#input\_lambda\_arn) | ARN of the lambda function | `string` | n/a | yes |
| <a name="input_lambda_log_group_arn"></a> [lambda\_log\_group\_arn](#input\_lambda\_log\_group\_arn) | ARN of the log group to write logs to. | `string` | n/a | yes |
| <a name="input_lambda_role_name"></a> [lambda\_role\_name](#input\_lambda\_role\_name) | Name of the lambda role to attach policies to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqs_url"></a> [sqs\_url](#output\_sqs\_url) | The URL of the created SQS instance. |
<!-- END_TF_DOCS -->