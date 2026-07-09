---
name: project-scope
description: What this repo is, where its Terraform lives, and the sibling tf-writer agent whose standards audits should be checked against
metadata:
  type: project
---

This repo is a static HTML5/CSS3 portfolio site (no JS, no build step, no framework) deployed to
AWS S3 + CloudFront, provisioned with Terraform in `terraform/` (`main.tf`, `variables.tf`,
`providers.tf`, `outputs.tf`, `backend.tf`), and automated via GitHub Actions (per root `CLAUDE.md`).
As of 2026-07-09 there is no `.github/workflows/` directory yet and no IAM/OIDC Terraform resources
anywhere in the repo — so IAM-least-privilege and OIDC-trust-scoping checklist items are currently
N/A. Re-check for an `github-oidc.tf` or similar once CI/CD deploy automation is added, since that's
exactly where wildcard IAM actions/resources and unscoped OIDC trust policies tend to appear.

There is a sibling subagent `.claude/agents/tf-writer.md` that generates this project's Terraform. Its
stated standards already say: S3 private + versioning, CloudFront OAC + redirect-to-HTTPS + TLS1.2 min,
IAM least privilege/no wildcards, use `aws_caller_identity`/`aws_region` instead of hardcoding. When
security-auditor finds a gap that contradicts tf-writer's own documented standards (e.g. missing S3
versioning/encryption, missing CSP header), it's worth flagging that gap against tf-writer's own rules
in the finding, since it's likely an oversight rather than an intentional tradeoff. See
[[pattern-managed-security-headers-csp-gap]] and [[pattern-check-gitignore-for-state]].
