# Terraform backend configuration for remote state
#
# SETUP INSTRUCTIONS:
# 1. First run: terraform init (without backend)
# 2. Create the S3 bucket and DynamoDB table for state management
# 3. Uncomment the backend block below
# 4. Run: terraform init -migrate-state
#
# This approach ensures the backend infrastructure is created before
# attempting to migrate state to it.

# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-bucket-name"
#     key            = "portfolio-site/terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "terraform-locks"
#   }
# }
