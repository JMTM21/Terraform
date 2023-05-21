terraform {
  required_version = ">=1.3.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.57.0"
    }

    random = {

      source  = "hashicorp/terraform-provider-random"
      version = ">=3.5.1"
    }


  }
}

#Can specify certain features below, not essential but block has to be there

provider "azurerm" {
  features {}

}
