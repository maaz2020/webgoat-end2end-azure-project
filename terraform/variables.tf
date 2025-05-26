variable "resource_group_name" {
  type    = string
  default = "vulnerable-apps-rg"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to the SSH public key for the admin user"
}

variable "vms" {
  type = map(object({
    script = string
  }))

  default = {
    jenkins-vm = {
      script = "scripts/install_jenkins.sh"
    }
    webgoat-vm = {
      script = "scripts/install_webgoat.sh"
    }
    sonar-vm = {
      script = "scripts/install_sonar.sh"
    }
    juice-shop-vm = {
      script = "scripts/install_juice_shop.sh"
    }
  }
}



