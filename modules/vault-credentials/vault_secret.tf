resource "vault_kv_secret_v2" "credentials" {
  for_each = { for i, val in var.credentials : i => val }

  mount               = var.vault_kv2_mount
  name                = "${var.path_prefix}/${var.role}/${each.key}"
  delete_all_versions = true
  data_json = jsonencode(
    {
      access_key = each.value.access_key,
      secret_key = each.value.secret_key,
    }
  )
  custom_metadata {
    max_versions = 2
    data         = var.metadata
  }
}
