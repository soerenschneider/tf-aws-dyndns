locals {
  github_repo    = "soerenschneider/dyndns"
  latest_release = jsondecode(data.http.github_latest_release.response_body)["tag_name"]
  version        = length(var.dyndns_version) > 0 ? var.dyndns_version : local.latest_release
}

resource "time_sleep" "wait_60_seconds" {
  depends_on = [null_resource.checkout_and_build]

  create_duration = "60s"
}

data "http" "github_latest_release" {
  url = "https://api.github.com/repos/${local.github_repo}/releases/latest"

  request_headers = {
    Accept = "application/vnd.github.v3+json"
  }
}

resource "local_file" "checkout_git_repo" {
  content         = <<-EOF
    #!/usr/bin/env bash
    set -e

    REPO_DIR="${path.cwd}/tmp/repo"

    if [ ! -d "$REPO_DIR" ]; then
      git clone "https://github.com/${local.github_repo}" $REPO_DIR
    else
      git -C $REPO_DIR checkout main
      git -C $REPO_DIR pull origin main
    fi

    cd $REPO_DIR
    git checkout ${local.version}

    make lambda-server
  EOF
  filename        = "${path.cwd}/tmp/checkout_and_build.sh"
  file_permission = "0755"
}

resource "null_resource" "checkout_and_build" {
  provisioner "local-exec" {
    command = local_file.checkout_git_repo.filename
  }

  triggers = {
    version = local.version
  }

  depends_on = [
    local_file.checkout_git_repo
  ]
}
