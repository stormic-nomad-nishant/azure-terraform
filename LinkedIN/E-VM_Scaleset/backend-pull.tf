data "terraform_remote_state" "virtual-network" {
  backend = "azurerm"
  config = {
    storage_account_name = "linkedinstg"
    container_name = "linkedin-devs"
    key = "Virtual_network"

  }
}

data "terraform_remote_state" "loadbalancer" {
  backend = "azurerm"
  config = {
    storage_account_name = "linkedinstg"
    container_name = "linkedin-devs"
    key = "Loadbalancer"

  }
}