terraform {
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {
  }
}

data "azurerm_virtual_network" "pevnet" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_vnet_name
}

data "azurerm_subnet" "pesubnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_vnet_name
  virtual_network_name = var.virtual_network_name
}

resource "azurerm_private_endpoint" "pe" {
  for_each = var.private_endpoints

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = each.value.subnet_id

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_groups[each.key]
    content {
      name                 = private_dns_zone_group.key
      private_dns_zone_ids = private_dns_zone_group.value
    }
  }

  private_service_connection {
    name                           = each.value.private_service_connection.name
    private_connection_resource_id = each.value.private_service_connection.private_connection_resource_id
    subresource_names              = each.value.private_service_connection.subresource_names
    is_manual_connection           = each.value.private_service_connection.is_manual_connection
    request_message                = each.value.private_service_connection.request_message
  }
}