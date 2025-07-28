output "sg_id" {
  value = aws_security_group.ecs_security_group.id
}

output "alb_sg_id" {
  value = aws_security_group.alb_security_group.id
}

output "nlb_sg_id" {
  value = aws_security_group.nlb_security_group.id
}
