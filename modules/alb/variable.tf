variable "name" {
  description = "Name prefix for ALB and related resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ALB will be deployed"
  type        = string
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet IDs for internal ALB"
}

variable "alb_sg_id" {
  description = "Security group ID for the ALB"
  type        = string
}
