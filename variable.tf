variable "subscriptionID" {
  type      = string
  sensitive = true
}

variable "tenantid" {
  type      = string
  sensitive = true
}
variable "clientid" {
  type      = string
  sensitive = true
}

variable "clientsecret" {
  type      = string
  sensitive = true
}
######################################################################

variable "resourceGroupName" {
  description = "The name of the resource group."
  type        = string
}
variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
}
######################################################################

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}
variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}
variable "subnet_names" {
  description = "The names of the subnets."
  type        = list(string)
}
variable "subnet_prefixes" {
  description = "The address prefixes for the subnets."
  type        = list(string)
}

######################################################################
variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "public_network_access_enabled" {
  description = "Boolean flag to enable or disable public network access."
  type        = bool
}

#################################################################
variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
}

variable "akv_allowed_ip_addresses" {
  description = "List of allowed IP addresses for accessing key vault."
  type        = list(string)
}

variable "azurerm_private_dns_zone_virtual_network_link_kv_name" {
  description = "Name of  keyvalut virtual link Name"
}

variable "azurerm_private_endpoint_kv_name" {
  description = "Name of  keyvalut private end point Name"
  type        = string
}

variable "private_service_connection_kv_name" {
  description = "Name of  keyvalut private service connection Name"
  type        = string
}

variable "private_dns_zone_group_kv_name" {
  description = "Name of  keyvalut dns group Name"
  type        = string
}

variable "object_id" {
  description = "Object ID of user for Key Vault access policy."
  type        = string
}

######################################################################

variable "azurerm_storage_account_name" {
  description = "Name of  storage account Name"
  type        = string
}

variable "storage_container_name" {
  description = "Name of the Azure Storage Container"
  type        = string
}

variable "st_allowed_ip_addresses" {
  description = "List of allowed IP addresses."
  type        = list(string)
}

variable "azurerm_private_dns_zone_virtual_network_link_storage_name" {
  description = "Name of  storage virtual link Name"
  type        = string
}

variable "azurerm_private_endpoint_storage_name" {
  description = "Name of  storage private end point Name"
  type        = string
}

variable "private_service_connection_storage_name" {
  description = "Name of  storage private service connection Name"
  type        = string
}

variable "private_dns_zone_group_storage_name" {
  description = "Name of  storage dns group Name"
  type        = string
}

######################################################################
variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "aks_agents_availability_zones" {
  description = "Availability zones for AKS nodes."
  type        = list(string)
}

variable "net_profile_dns_service_ip" {
  description = "The DNS service IP for AKS networking profile."
  type        = string
}

variable "net_profile_service_cidr" {
  description = "The service CIDR for AKS networking profile."
  type        = string
}

variable "aks_prefix" {
  description = "Prefix for AKS-related resources."
  type        = string
}

variable "log_analytics_ws_name" {
  description = "Name of the log analytics workspace will be created and attached to AKS."
  type        = string
}

variable "agent_name" {
  description = "Name of the agent pool."
  type        = string
}

variable "agent_size" {
  description = "Size of each node in the agent pool."
  type        = string
}

#################################################################

variable "apim_name" {
  description = "The name of the API Management service."
  type        = string
}

variable "apim_publisher_name" {
  description = "Publisher/display name for APIM."
  type        = string
}

variable "apim_publisher_email" {
  description = "Publisher email for APIM."
  type        = string
}

variable "apim_sku" {
  description = "SKU name for API Management. Use 'Consumption_0' for Consumption tier."
  type        = string
  default     = "Consumption_0"
}

#################################################################