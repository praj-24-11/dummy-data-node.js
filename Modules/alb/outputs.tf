output "alb_arn" {
  value = aws_lb.api_alb.arn
}

output "alb_dns_name" {
  value = aws_lb.api_alb.dns_name
}

output "target_group_blue_arn" {
  value = aws_lb_target_group.blue.arn
}

output "target_group_green_arn" {
  value = aws_lb_target_group.green.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.blue.arn  # or choose another group depending on your use case (blue/green)
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id  # make sure this refers to the correct security group ID
}
