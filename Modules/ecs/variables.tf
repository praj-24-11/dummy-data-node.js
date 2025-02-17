variable "project_name" {
  description = "Project name"
  type        = string
}

variable "container_image" {
  description = "ECR image URL"
  type        = string
}

variable "cpu" {
  description = "CPU for ECS task"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Memory for ECS task"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 2
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for ECS tasks"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security group ID for ECS tasks"
  type        = string
}

variable "target_group_arn" {
  description = "Target group ARN for ALB"
  type        = string
}

variable "secret_arn" {
  description = "ARN for storing secrets in AWS Secrets Manager"
  type        = string
}
