variable "ecr_repo_name" {
  type        = list(string)
  description = "ECR Repo name list"
}

variable "alb_sg_name" {
  type        = string
  description = "Security group name for ALB"
}

variable "sg_name" {
  type        = string
  description = "Security group name for ECS tasks"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDRs"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones"
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "execution_role_arn" {
  type        = string
  description = "IAM role ARN for ECS task execution"
}

variable "cognito_domain_prefix" {
  type        = string
  description = "Prefix for Cognito hosted domain"
}

variable "alb_dns_name" {
  type        = string
  description = "DNS name of the Application Load Balancer"
}

variable "user_pool_id" {
  type        = string
  description = "ID of the Cognito User Pool"
}
