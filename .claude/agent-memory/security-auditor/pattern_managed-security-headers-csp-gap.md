---
name: pattern-managed-security-headers-csp-gap
description: AWS's CloudFront managed response headers policy "Managed-SecurityHeadersPolicy" does NOT include a Content-Security-Policy header, despite the name suggesting full coverage
metadata:
  type: project
---

When a CloudFront `default_cache_behavior` references
`data.aws_cloudfront_response_headers_policy.security_headers` pointed at the AWS-managed
`Managed-SecurityHeadersPolicy`, always flag that this managed policy only sets:
Strict-Transport-Security, X-Content-Type-Options, X-Frame-Options, X-XSS-Protection, and
Referrer-Policy. It does **not** set Content-Security-Policy.

**Why:** This checklist explicitly requires CSP to be configured, and it's easy to assume the managed
policy name implies full header coverage. Missed this would otherwise read as a false "pass".

**How to apply:** Whenever auditing a CloudFront distribution that relies on this managed policy (or
any managed response-headers policy) for its security headers, check specifically whether CSP is
present. If not, recommend replacing it with a custom `aws_cloudfront_response_headers_policy` that
sets `security_headers_config.content_security_policy` explicitly (in addition to the other headers),
scoped to the site's actual resource origins (script-src, style-src, img-src, etc.) rather than a
generic wildcard CSP.
