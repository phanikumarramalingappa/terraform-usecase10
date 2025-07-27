variable "api_name" {
  type        = string
  description = "Name of the API Gateway REST API"
}

variable "alb_dns_name" {
  type        = string
  description = "DNS name of the Application Load Balancer"
}

variable "internal_alb_arn" {
  description = "ARN of the internal ALB"
  type        = string
}

variable "user_pool_id" {
  type        = string
  description = "ID of the Cognito User Pool"
}

variable "user_pool_arn" {
  description = "ARN of the Cognito User Pool"
  type        = string
}
