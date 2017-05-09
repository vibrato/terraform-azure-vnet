variable "subscription_id" {
  type        = "string"
  description = ""
}

variable "client_id" {
  type        = "string"
  description = ""
}

variable "client_secret" {
  type        = "string"
  description = ""
}

variable "tenant_id" {
  type        = "string"
  description = ""
}

variable "stack_name" {
  type        = "string"
  description = ""
}

variable "azure_location" {
  type        = "string"
  description = ""
}

variable "environment" {
  type    = "string"
  default = "development"
}

variable "vnet_cidr" {
  type    = "string"
  default = "10.0.0.0/16"
}


# List of the subnets we are going to create
# CIDR will be calculated from the VNet CIDR
variable "subnets" {
  type = "list"

  default = [
    "dmz",
    "application",
    "data",
  ]
}