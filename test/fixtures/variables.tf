variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block to assign to the VPC"
}

variable "public_subnet_cidrs" {
  type = list(object({
    cidr     = string
    az_index = number
  }))
  description = "List of objects reprisenting the public subnets CIDRs and their availability zones. The az_index property is used as an index to retireve a zone from the list of the availability zones for the current AWS region."
}

variable "enable_port_8800" {
  type        = bool
  description = "Whether to create a listner and a target group for port 8800."
  default     = true
}

variable "lb_internal" {
  type        = bool
  description = "Whether to create internal load balancer."
  default     = false
}

variable "name_prefix" {
  type        = string
  description = "A string to be used as prefix for generating names of the created resources."
  default     = "tfe-"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to assign to all resources."
  default     = {}
}