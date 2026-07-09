---
name: pattern-check-gitignore-for-state
description: Always check terraform/.gitignore for *.tfstate / *.tfvars exclusions during an audit, not just the .tf resource files
metadata:
  type: project
---

Terraform security audits should include a check of `terraform/.gitignore` (or repo-root `.gitignore`)
for `*.tfstate`, `*.tfstate.*`, and `*.tfvars` exclusions — not just the `.tf` resource definitions.

**Why:** Terraform state files can contain sensitive data (resource ARNs, sometimes secrets/outputs),
and a missing gitignore entry is a real, easy-to-miss path to accidentally committing that data,
especially in repos (like this one) where the remote backend (`backend.tf`) is intentionally left
commented out pending manual bootstrap, meaning state defaults to local `terraform.tfstate` files.

**How to apply:** In every Terraform security audit, read the relevant `.gitignore` alongside the `.tf`
files. If `*.tfstate`/`*.tfvars` aren't excluded, flag it as a HIGH finding even though it's not a
resource misconfiguration — it's a data-exposure risk in the IaC workflow itself. Also check whether
`backend.tf` is commented out (as it is in this repo as of 2026-07-09) — that's a strong signal state is
being kept locally.
