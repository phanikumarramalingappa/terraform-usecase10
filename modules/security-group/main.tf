resource "aws_security_group" "alb_security_group" {
  name        = var.alb_sg_name
  description = "Security group for internal ALB"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ecs_security_group" {
  name        = "ecs-service-sg"
  description = "Allow traffic from ALB to ECS containers"
  vpc_id      = var.vpc_id

  ingress {
    description              = "Allow traffic from ALB on port 3000"
    from_port                = 3000
    to_port                  = 3000
    protocol                 = "tcp"
    security_groups          = [aws_security_group.alb_security_group.id]
  }

  ingress {
    description              = "Allow traffic from ALB on port 3001"
    from_port                = 3001
    to_port                  = 3001
    protocol                 = "tcp"
    security_groups          = [aws_security_group.alb_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
