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
| [aws_iam_access_key.client](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_access_key) | resource |
| [aws_iam_access_key.server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_access_key) | resource |
| [aws_iam_group.clients](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_group) | resource |
| [aws_iam_group.servers](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.clients](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_membership.servers](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.clients](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_policy) | resource |
| [aws_iam_user.client](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_user) | resource |
| [aws_iam_user.server](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_user) | resource |
| [aws_iam_policy_document.route53_upsert](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_clients"></a> [clients](#input\_clients) | A list of usernames that are created to interact as a client with DynDns resources. | `set(string)` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_hosted_zone_id"></a> [hosted\_zone\_id](#input\_hosted\_zone\_id) | AWS Route53 hosted zone id that holds the DNS records we want to keep updated. | `string` | n/a | yes |
| <a name="input_servers"></a> [servers](#input\_servers) | A list of usernames that are created to interact as a server with DynDns resources. | `set(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clients"></a> [clients](#output\_clients) | Map containing access credentials of all the created client users. |
| <a name="output_clients_group_name"></a> [clients\_group\_name](#output\_clients\_group\_name) | The name of the IAM group that holds all the clients of DynDns. |
| <a name="output_servers"></a> [servers](#output\_servers) | Map containing access credentials of all the created server users. |
| <a name="output_servers_group_name"></a> [servers\_group\_name](#output\_servers\_group\_name) | The name of the IAM group that holds all the servers of DynDns. |
<!-- END_TF_DOCS -->