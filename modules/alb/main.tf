resource "aws_lb" "this" {
  name               = var.name
  internal           = true
  load_balancer_type = "network"
  subnets            = var.private_subnets

  tags = {
    Name = var.name
  }
}

# Target Groups (still use HTTP protocol for ECS tasks)
resource "aws_lb_target_group" "patients" {
  name         = "${var.name}-tg-patients"
  port         = 3000
  protocol     = "TCP"  # ✅ NLB only supports TCP/UDP
  vpc_id       = var.vpc_id
  target_type  = "ip"

  health_check {
    port                = "3000"
    protocol            = "TCP"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group" "appointments" {
  name         = "${var.name}-tg-appointments"
  port         = 3001
  protocol     = "TCP"  # ✅ NLB only supports TCP/UDP
  vpc_id       = var.vpc_id
  target_type  = "ip"

  health_check {
    port                = "3001"
    protocol            = "TCP"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Listener (NLB only supports TCP/UDP listeners)
resource "aws_lb_listener" "patients" {
  load_balancer_arn = aws_lb.this.arn
  port              = 3000
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.patients.arn
  }
}

resource "aws_lb_listener" "appointments" {
  load_balancer_arn = aws_lb.this.arn
  port              = 3001
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.appointments.arn
  }
}
