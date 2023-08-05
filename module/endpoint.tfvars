# Example variables.tfvars
virtual_network_name     = "us-prov-central-us-internal-vnet"
resource_group_vnet_name = "us-prov-central-us-internal-networks"
subnet_name              = "us-prov-central-us-internal-acr-subnet"
subnet_name2             =  "us-prov-central-us-internal-blob-subnet"

private_endpoints = {
  "acr_endpoint" = {
    name                = "acr-private-endpoint"
    location            = "East US"
    resource_group_name = "us-prov-central-us-internal-networks"
    subnet_id           = "/subscriptions/9fdc4f39-d2ad-409d-bd5d-223bbe3a88be/resourceGroups/us-prov-central-us-internal-networks/providers/Microsoft.Network/virtualNetworks/us-prov-central-us-internal-vnet/subnets/us-prov-central-us-internal-acr-subnet"

    private_service_connection = {
      name                           = "acr-private-connection"
      private_connection_resource_id = "/subscriptions/9fdc4f39-d2ad-409d-bd5d-223bbe3a88be/resourceGroups/acrTesting/providers/Microsoft.ContainerRegistry/registries/testacrnewregistrytestingdctt"
      subresource_names              = ["registry"]
      is_manual_connection           = true
      request_message                = "not any"
    }
  }
  # "blob_storage_endpoint" = {
  #   name                = "blob-storage-private-endpoint"
  #   location            = "East US"
  #   resource_group_name = "us-prov-central-us-internal-networks"
  #   subnet_id           = "/subscriptions/9fdc4f39-d2ad-409d-bd5d-223bbe3a88be/resourceGroups/us-prov-central-us-internal-networks/providers/Microsoft.Network/virtualNetworks/us-prov-central-us-internal-vnet/subnets/us-prov-central-us-internal-blob-subnet"
  #   private_service_connection = {
  #     name                           = "blob-storage-private-connection"
  #     private_connection_resource_id = "/subscriptions/9fdc4f39-d2ad-409d-bd5d-223bbe3a88be/resourceGroups/us-prov-central-us-internal-networks/providers/Microsoft.Storage/storageAccounts/endpointblobstorage"
  #     subresource_names              = ["blob"]
  #     is_manual_connection           = true
  #     request_message                = "not any"
  #   }
  # }
}

private_dns_zone_groups = {
  "acr_endpoint" = {
    "privatelink.azurecr.io" = ["/subscriptions/9fdc4f39-d2ad-409d-bd5d-223bbe3a88be/resourceGroups/us-prov-central-us-internal-networks/providers/Microsoft.Network/privateDnsZones/zone1.example.com"]
  }
}
#   "blob_storage_endpoint" = {
#     "privatelink.blobcore.windows.net" = ["/subscriptions/9fdc4f39-d2ad-409d-bd5d-223bbe3a88be/resourceGroups/us-prov-central-us-internal-networks/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
#   }
# }




