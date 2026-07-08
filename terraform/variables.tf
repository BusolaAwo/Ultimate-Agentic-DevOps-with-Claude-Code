variable "region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "portfolio-site"
}

variable "environment" {
  description = "Environment name (production, staging, etc.)"
  type        = string
  default     = "production"
}

variable "domain_name" {
  description = "Custom domain name for the website (optional)"
  type        = string
  default     = ""
}
