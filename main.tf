terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

resource "random_string" "suffix" {
  length = 4
  upper = false
  special = false
  numeric = true
  lower = false
}

data "azurecaf_name" "container_app" {
  resource_type = "azurerm_container_app"
  suffixes = [var.environment, var.location, var.solution_name, random_string.suffix.result]
}

resource "azurerm_container_app" "container_app" {
  name = data.azurecaf_name.container_app.result
  resource_group_name = var.resource_group_name
  container_app_environment_id = var.container_app_environment_id
  revision_mode = var.revision_mode
  identity {
    type = "SystemAssigned"
  }
  template {
    container {
      name   = var.container.name
      image  = var.container.image
      cpu    = var.container.cpu
      memory = var.container.memory
    }
  }
}
