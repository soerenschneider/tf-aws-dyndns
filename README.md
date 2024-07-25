# tf-aws-dyndns

![gitleaks](https://github.com/soerenschneider/tf-aws-dyndns/actions/workflows/gitleaks.yaml/badge.svg)
![lint-workflow](https://github.com/soerenschneider/tf-aws-dyndns/actions/workflows/lint.yaml/badge.svg)
![security-workflow](https://github.com/soerenschneider/tf-aws-dyndns/actions/workflows/security.yaml/badge.svg)

This repository implements Infrastructure as Code (IaC) using [OpenTofu](https://opentofu.org/) to configure all resources necessary to run the [dyndns](https://github.com/soerenschneider/dyndns) service.

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)

## Getting Started

Follow these instructions to set up the repository and start managing your AWS and Vault resources.

### Prerequisites

- AWS account and appropriate permissions to create resources in the account
- [OpenTofu](https://opentofu.org/)
- Terragrunt

### Running the code

1. **Clone the repository:**
   ```bash
   git clone https://github.com/soerenschneider/tf-aws-dyndns.git
   cd tf-aws-dyndns
   ```

2. **Provisioning resources:**
   ```bash
   cd envs/dev
   bash run.sh
   ```
