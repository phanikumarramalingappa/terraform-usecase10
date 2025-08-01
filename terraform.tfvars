ecr_repo_name = ["node-appointment", "node-patient"]
alb_sg_name = "alb-mc-sg"
sg_name = "app-mc-sg"
vpc_cidr = "10.0.0.0/16"
vpc_name = "vpc-mc"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
azs = ["ap-south-1a", "ap-south-1b"]
cluster_name = "ecs-mc-cluster"
execution_role_arn = "arn:aws:iam::911891700576:role/ecsTaskExecutionRole"
cognito_domain_prefix = "appointment-patient-auth"
