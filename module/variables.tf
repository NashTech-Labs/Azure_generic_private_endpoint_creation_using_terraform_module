variable "virtual_network_name" {
  type = string
}

variable "resource_group_vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}
# variable "subnet_name2" {
#   type = string
# }

variable "private_endpoints" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_id           = string
    private_service_connection = object({
      name                           = string
      private_connection_resource_id = string
      subresource_names              = list(string)
      is_manual_connection           = bool
      request_message                = string
    })
  }))
  default = {
        
    }
  }
  


variable "private_dns_zone_groups" {
  type = map(map(list(string)))
}