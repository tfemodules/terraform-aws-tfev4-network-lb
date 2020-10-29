output "lb_dns_name" {
  value       = module.tfe_network_lb.lb_dns_name
  description = "DNS name of the created load balancer."
}

output "lb_tg_80_arn" {
  value       = module.tfe_network_lb.lb_tg_80_arn
  description = "ARN (id) of the load balancer target group assigned to the listner on port 80."
}

output "lb_tg_443_arn" {
  value       = module.tfe_network_lb.lb_tg_443_arn
  description = "ARN (id) of the load balancer target group assigned to the listner on port 443."
}

output "lb_tg_8800_arn" {
  value       = module.tfe_network_lb.lb_tg_8800_arn
  description = "ARN (id) of the load balancer target group assigned to the listner on port 8800."
}