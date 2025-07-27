variable "user_pool_name" {
  type        = string
  description = "Name of the Cognito User Pool"
}

variable "app_client_name" {
  type        = string
  description = "Name of the Cognito App Client"
}

variable "cognito_domain_prefix" {
  type        = string
  description = "Prefix for Cognito hosted domain"
}
