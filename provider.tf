#Terrform suggests everything inside the brackets is to be read as terraform
#The required providers is pulling in the provider we want to use and sepcifying what the source and version are
terraform {
  required_version = ">=1.3.9"
  required_providers {
    azurerm = {
      source  = "hasicorp/azurerm"
      version = "=3.0.0"
    }


  }

  #Can specify certain features below, not essential but block has to be there

  provider "azurerm" {
    features {}

  }


}

