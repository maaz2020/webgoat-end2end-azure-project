# This file defines the variables used in the Terraform configuration for deploying WebGoat on Azure.
variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "devsecops-webgoat-lab"
}

variable "prefix" {
  description = "Prefix for all resources"
  type        = string
  default     = "webgoat"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Lab"
    Project     = "DevSecOps"
  }
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default     = "~/.ssh/azure_rsa.pub"
}

variable "ssh_source_address" {
  description = "Source IP allowed for SSH access"
  type        = string
  default     = "*"
}

variable "web_source_address" {
  description = "Source IP allowed for WebGoat access"
  type        = string
  default     = "*"
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_B2s" # 2 vCPUs, 4GB RAM
}
