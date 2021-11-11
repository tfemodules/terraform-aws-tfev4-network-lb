variable "vpc_id" {
  type        = string
  description = "Id of the VPC to create the load balancer in."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet ids in which to place the load balancer nodes."
}

variable "lb_internal" {
  type        = bool
  description = "Whether to create internal load balancer."
  default     = false
}

variable "enable_port_8800" {
  type        = bool
  description = "Whether to create a listner and a target group for port 8800."
  default     = true
}

variable "name_prefix" {
  type        = string
  description = "A string to be used as prefix for generating names of the created resources."
  validation {
    condition     = length(var.name_prefix) <= 24
    error_message = "Value for variable name_prefix cannot be a string of more than 24 characters."
  }
  default = "tfe-"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to assign to all resources."
  default     = {}
}