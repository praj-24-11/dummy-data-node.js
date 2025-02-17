variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "dummy-data-api"
}

# Networking Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = []
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"] # Add your AZs here
}

# ECS Variables
variable "container_image" {
  description = "Docker image for the ECS task"
  type        = string
  default     = "123456789.dkr.ecr.us-east-1.amazonaws.com/dummy-api:latest"
}

variable "cpu" {
  description = "CPU units for the container"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Memory for the container"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 2
}

variable "secret_arn" {
  description = "ARN of the Secrets Manager secret"
  type        = string
  default     = "arn:aws:secretsmanager:us-east-1:123456789:secret:API_SECRET_KEY"
}

# API Gateway Variables
variable "rate_limit" {
  description = "API Gateway rate limit"
  type        = number
  default     = 10
}

variable "burst_limit" {
  description = "API Gateway burst limit"
  type        = number
  default     = 5000
}

# WAF Variables
variable "waf_rate_limit" {
  description = "Rate limit for WAF"
  type        = number
  default     = 1000
}

# ECR Variables
variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "dummy-api"
}
