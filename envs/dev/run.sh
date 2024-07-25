#!/usr/bin/env bash

set -e

TF_ENCRYPTION=$(cat <<EOF
key_provider "pbkdf2" "mykey" {
  passphrase = "somekeynotverysecure"
}
EOF
)
export TF_ENCRYPTION

terragrunt init -upgrade

timeout 25 sh -c 'until nc -z $0 $1; do sleep 1; done' 127.0.0.1 8200

terragrunt apply

terragrunt destroy && rm -f terraform.tfstate

