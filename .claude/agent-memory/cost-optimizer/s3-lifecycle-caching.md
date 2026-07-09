---
name: s3-lifecycle-caching
description: Portfolio S3 bucket missing lifecycle policies and 404 response caching; quick wins available
metadata:
  type: project
---

**Current State:** 
- S3 bucket has no lifecycle policies configured
- CloudFront 404 error response caching disabled (error_caching_min_ttl = 0)
- No S3 versioning explicitly configured (defaults to disabled)

**Identified Quick Wins:**

1. **404 Response Caching** — error_caching_min_ttl currently 0
   - Why: Bots and crawlers frequently hit non-existent portfolio URLs, generating repeated origin requests
   - Recommended: Set error_caching_min_ttl to 300-3600 seconds to cache 404s at CloudFront
   - Impact: Low but measurable (reduces 10-30% of requests if bot traffic is significant)

2. **S3 Lifecycle Policy for Incomplete Uploads** — not currently configured
   - Why: Failed multipart uploads can accumulate storage costs
   - Recommended: Add lifecycle rule to abort incomplete multipart uploads after 7 days
   - Impact: Low for portfolio but prevents cost leaks

3. **Versioning Status** — implicit but worth explicit configuration
   - Why: Versioning is disabled by default; enabling it doubles storage costs when deploying updated files
   - Recommended: Keep versioning disabled unless rollback capability needed
   - Impact: Medium (versioning can double S3 storage costs)

**Note:** For a portfolio website with infrequent updates, S3 storage costs are minimal (~$0.50/month for <1GB). Focus on CloudFront optimization instead [[portfolio-cloudfront-pricing]].
