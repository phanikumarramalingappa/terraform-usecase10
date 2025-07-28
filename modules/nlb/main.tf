resource "aws_lb" "nlb" {
  name               = var.name
  internal           = true
  load_balancer_type = "network"
  security_groups    = [var.nlb_sg_id]
  subnets            = var.private_subnets
}

resource "aws_lb_target_group" "nlb_tg" {
  name        = var.target_group_name
  port        = 80
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "alb"

  health_check {
    protocol = "HTTP"
    path     = "/alb"
    port     = "traffic-port"
  }
}


resource "aws_lb_target_group_attachment" "tg_attachment" {
  target_group_arn = aws_lb_target_group.nlb_tg.arn
  target_id        = var.alb_id
  port             = 80             
}


resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}

resource "aws_api_gateway_vpc_link" "example" {
  name        = "uc10-vpc-link"
  description = "VPC link for API gateway"
  target_arns = [aws_lb.nlb.arn]
}
