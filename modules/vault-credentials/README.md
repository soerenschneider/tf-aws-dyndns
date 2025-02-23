<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 4.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_kv_secret_v2.credentials](https://registry.terraform.io/providers/hashicorp/vault/4.2.0/docs/resources/kv_secret_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_credentials"></a> [credentials](#input\_credentials) | List of credentials for the appropriate IAM user. | <pre>map(<br>    object({<br>      access_key = string,<br>      secret_key = string,<br>  }))</pre> | n/a | yes |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Optional metadata to attach to the secret data. | `map(any)` | `null` | no |
| <a name="input_path_prefix"></a> [path\_prefix](#input\_path\_prefix) | Prefix added to the path where secrets are stored. | `string` | `"dyndns"` | no |
| <a name="input_role"></a> [role](#input\_role) | Role of the IAM user, must be either 'client' or 'server' and is used to build the KV2 path. | `string` | n/a | yes |
| <a name="input_vault_kv2_mount"></a> [vault\_kv2\_mount](#input\_vault\_kv2\_mount) | Path where KV2 secret engine is mounted in HashiCorp Vault. | `string` | `"secret"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->