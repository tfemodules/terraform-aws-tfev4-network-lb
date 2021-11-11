vpc_cidr_block = "172.31.255.0/24"
public_subnet_cidrs = [
  {
    cidr     = "172.31.255.0/28",
    az_index = 0,
  },
  {
    cidr     = "172.31.255.16/28",
    az_index = 1
  },
]
name_prefix = "test-tfe-network-lb-"
common_tags = {
  project = "kitchen-test-tfe-network-lb"
}
lb_internal      = false
enable_port_8800 = true