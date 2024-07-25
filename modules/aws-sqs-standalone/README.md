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
| [aws_iam_group_policy_attachment.client](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.sqs_server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_policy) | resource |
| [aws_sqs_queue.dyndns](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/sqs_queue) | resource |
| [aws_iam_policy_document.sqs_client](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sqs_server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_clients_group_name"></a> [clients\_group\_name](#input\_clients\_group\_name) | The name of the IAM group that holds all the clients interacting with DynDns. | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment. Must be either 'dev', 'dqs' or 'prod'. | `string` | n/a | yes |
| <a name="input_servers_group_name"></a> [servers\_group\_name](#input\_servers\_group\_name) | The name of the IAM group that holds all the servers interacting with DynDns. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqs_arn"></a> [sqs\_arn](#output\_sqs\_arn) | n/a |
| <a name="output_sqs_url"></a> [sqs\_url](#output\_sqs\_url) | The URL of the created SQS instance. |
<!-- END_TF_DOCS -->