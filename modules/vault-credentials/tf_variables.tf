variable "role" {
  type = string

  validation {
    condition     = var.role == "client" || var.role == "server"
    error_message = "The role must be either 'client' or 'server'."
  }

  description = "Role of the IAM user, must be either 'client' or 'server' and is used to build the KV2 path."
}

variable "credentials" {
  type = map(
    object({
      access_key = string,
      secret_key = string,
  }))

  description = "List of credentials for the appropriate IAM user."
}

variable "vault_kv2_mount" {
  type    = string
  default = "secret"

  validation {
    condition     = !endswith(var.vault_kv2_mount, "/") && length(var.vault_kv2_mount) > 3
    error_message = "vault_kv2_mount should not end with a slash."
  }

  description = "Path where KV2 secret engine is mounted in HashiCorp Vault."
}

variable "path_prefix" {
  type    = string
  default = "dyndns"

  validation {
    condition     = length(var.path_prefix) >= 3
    error_message = "path_prefix must be more than 2 characters."
  }

  validation {
    condition     = !(startswith(var.path_prefix, "/") || endswith(var.path_prefix, "/"))
    error_message = "Invalid path_prefix: must not start or end with a slash ('/')."
  }

  description = "Prefix added to the path where secrets are stored."
}

variable "metadata" {
  type    = map(any)
  default = null

  description = "Optional metadata to attach to the secret data."
}
