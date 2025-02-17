variable "project_name" {
  description = "Project name"
  type        = string
}

variable "alb_dns_name" {
  description = "ALB DNS name"
  type        = string
}

variable "cognito_user_pool_arn" {
  description = "Cognito User Pool ARN"
  type        = string
}

variable "rate_limit" {
  description = "Rate limit for API Gateway"
  type        = number
  default     = 10
}

variable "burst_limit" {
  description = "Burst limit for API Gateway"
  type        = number
  default     = 20
}

