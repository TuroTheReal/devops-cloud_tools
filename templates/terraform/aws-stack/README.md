# AWS Terraform stack (template)

A **static** starter skeleton for a single AWS Terraform stack. Copy it, fill the
placeholders, add your resources. It is intentionally **generic**: not "frontend"
or "backend", just a well-structured blank stack you build on.

## What "stack" means here

A *stack* = a **root Terraform module**: one directory you run `terraform apply`
in, with its **own state file**. It manages one coherent set of infra (one blast
radius). A *child module* (under `modules/`) is reusable, parameterized, and
called by a stack; it has no backend/state of its own.

## Files

| File | Role |
| --- | --- |
| `versions.tf` | Terraform + provider version pins, and the S3 remote state backend |
| `providers.tf` | AWS provider config + `default_tags` applied to every resource |
| `variables.tf` | input variables (the knobs) |
| `main.tf` | where you add resources / module calls |
| `outputs.tf` | values you export |
| `terraform.tfvars.example` | copy to `terraform.tfvars` (gitignored) and fill in |
| `Makefile` | `make init/fmt/validate/plan/apply/destroy` |

## Use

```bash
cp -r ~/devops-cloud_tools/templates/terraform/aws-stack/ ~/my-stack/
cd ~/my-stack/
# 1. replace every CHANGE_ME (versions.tf backend, variables.tf) with real values
# 2. cp terraform.tfvars.example terraform.tfvars  and fill it
make init && make plan
```

## Conventions baked in

- **One stack = one state** (`key` in the backend). Split infra by blast radius /
  lifecycle / ownership (network, data, app), not by frontend/backend.
- **Remote state in S3** with native locking (`use_lockfile`, Terraform >= 1.10).
- **Pinned versions** for reproducible `init`.
- **`default_tags`** so every resource is tagged (Project / Env / ManagedBy).
- **`.terraform.lock.hcl` is committed**; state and tfvars are gitignored.

## Environments (dev / staging / prod)

Two common patterns, pick one:
- **Directory per env** (`environments/dev/`, `environments/prod/`), each a stack
  calling shared `modules/`. Explicit and recommended for prod separation.
- **Workspaces** (`terraform workspace`): one config, multiple states. Cheaper but
  easier to apply to the wrong env, so many avoid it for prod.

## Docs

- Terraform language: https://developer.hashicorp.com/terraform/language
- AWS provider: https://registry.terraform.io/providers/hashicorp/aws/latest
- Recommended module structure: https://developer.hashicorp.com/terraform/language/modules/develop/structure
