output "ecs_cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "ecs_service_id" {
  value = aws_ecs_service.api.id
}

output "ecs_service_name" {
  value = aws_ecs_service.api.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.api.arn
}
