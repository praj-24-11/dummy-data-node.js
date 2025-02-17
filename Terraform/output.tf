# Networking Outputs
output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.networking.private_subnet_ids
}

# ECS Outputs
output "ecs_cluster_id" {
  value = module.ecs.ecs_cluster_id
}


# ALB Outputs
output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_target_group_arn" {
  value = module.alb.target_group_arn
}

# API Gateway Outputs
output "api_gateway_id" {
  value = module.api_gateway.api_gateway_id
}

# Cognito Outputs
output "cognito_user_pool_id" {
  value = module.cognito.cognito_user_pool_id
}

output "cognito_user_pool_arn" {
  value = module.cognito.cognito_user_pool_arn
}

# WAF Outputs
output "waf_arn" {
  value = module.waf.waf_arn
}

# ECR Outputs
output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "ecs_service_name" {
  value = module.ecs.ecs_service_name
}

output "ecs_task_definition_arn" {
  value = module.ecs.ecs_task_definition_arn
}

