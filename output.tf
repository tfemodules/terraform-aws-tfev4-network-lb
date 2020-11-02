output "lb_dns_name" {
  value       = aws_lb.tfe.dns_name
  description = "DNS name of the created load balancer."
}

output "lb_arn" {
  value       = aws_lb.tfe.arn
  description = "The ARN of the created load balancer."
}

output "lb_tg_80_arn" {
  value       = aws_lb_target_group.port_80.arn
  description = "ARN (id) of the load balancer target group assigned to the listner on port 80."
}

output "lb_tg_443_arn" {
  value       = aws_lb_target_group.port_443.arn
  description = "ARN (id) of the load balancer target group assigned to the listner on port 443."
}

output "lb_tg_8800_arn" {
  value       = aws_lb_target_group.port_8800.arn
  description = "ARN (id) of the load balancer target group assigned to the listner on port 8800."
}