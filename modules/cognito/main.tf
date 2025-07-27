resource "aws_cognito_user_pool" "main" {
  name = "appointment-patient-user-pool"

  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_uppercase = true
    require_lowercase = true
    require_numbers   = true
    require_symbols   = false
  }

  tags = {
    Environment = "production"
  }
}

resource "aws_cognito_user_pool_client" "main" {
  name         = "appointment-patient-app-client"
  user_pool_id = aws_cognito_user_pool.main.id
  generate_secret = false

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]
}

resource "aws_cognito_user_pool_domain" "main" {
  domain       = "appointment-patient-auth"
  user_pool_id = aws_cognito_user_pool.main.id
}
