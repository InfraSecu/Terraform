provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestorageacc"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  
  # Correction 1: Utilisation de la géo-réplication pour éviter la perte de données
  account_replication_type = "GRS" # Géographiquement redondant
  
  # Correction 3: Forcer la version TLS minimum à 1.2
  min_tls_version          = "TLS1_2"
  
}
