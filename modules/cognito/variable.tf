variable "user_pool_name" {
  description = "Name of the Cognito User Pool"
  type        = string
}

variable "user_pool_client_name" {
  description = "Name of the Cognito User Pool Client"
  type        = string
}

variable "cognito_domain_prefix" {
  description = "Prefix for Cognito domain"
  type        = string
}

