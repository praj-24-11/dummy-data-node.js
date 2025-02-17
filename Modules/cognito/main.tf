resource "aws_cognito_user_pool" "api_users" {
  name = "${var.project_name}-user-pool"

  password_policy {
    minimum_length    = 8
    require_numbers   = true
    require_uppercase = true
    require_lowercase = true
    require_symbols   = false
  }

  username_attributes = ["email"]

  auto_verified_attributes = ["email"]

  schema {
    name                = "email"
    attribute_data_type = "String"
    required            = true
  }

  tags = {
    Name = "${var.project_name}-cognito-user-pool"
  }
}

resource "aws_cognito_user_pool_client" "api_client" {
  name         = "${var.project_name}-client"
  user_pool_id = aws_cognito_user_pool.api_users.id
  generate_secret = false
  explicit_auth_flows = [
    "ALLOW_ADMIN_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]
}

resource "aws_cognito_identity_pool" "identity_pool" {
  identity_pool_name               = "${var.project_name}-identity-pool"
  allow_unauthenticated_identities = false
}
