output "cognito_user_pool_id" {
  value = aws_cognito_user_pool.api_users.id
}

output "cognito_user_pool_arn" {
  value = aws_cognito_user_pool.api_users.arn
}

output "cognito_client_id" {
  value = aws_cognito_user_pool_client.api_client.id
}

output "cognito_identity_pool_id" {
  value = aws_cognito_identity_pool.identity_pool.id
}
