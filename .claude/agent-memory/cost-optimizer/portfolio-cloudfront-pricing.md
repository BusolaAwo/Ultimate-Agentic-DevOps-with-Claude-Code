---
name: portfolio-cloudfront-pricing
description: Static portfolio website using PriceClass_200; PriceClass_100 can reduce CloudFront costs by 30-50%
metadata:
  type: project
---

**Current State:** CloudFront distribution configured with PriceClass_200

**Optimization Opportunity:** Change to PriceClass_100 for a portfolio website

**Why:** A static HTML/CSS portfolio website has predictable traffic patterns concentrated in specific regions (likely visitor geographic location correlates with portfolio creator's location). PriceClass_200 covers 99% of internet users but at higher cost than PriceClass_100, which still covers ~90% of users in primary markets. For a personal portfolio, the difference is negligible for users but significant for costs.

**How to apply:** Update `price_class = "PriceClass_200"` to `price_class = "PriceClass_100"` in terraform/main.tf unless traffic analytics show global distribution needs.

**Estimated Impact:** 30-50% reduction in CloudFront data transfer charges (~$10-20/month savings depending on traffic volume). For a portfolio receiving 100-500k monthly viewers, expect $10-30 monthly savings.
