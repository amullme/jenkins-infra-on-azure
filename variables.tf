variable "allowed_cidr" {
  description = "The network rule CIDR"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
}

variable "public_key" {
  description = "Enter your SSH public key"
  type        = string
}