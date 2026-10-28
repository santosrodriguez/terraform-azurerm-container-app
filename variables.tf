variable "container_app_environment_id" {
  type = string
}

variable "container" {
  type = object({
    name = string
    image = string
    cpu = number
    memory = string
  })
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
  default = "eastus"
}

variable "resource_group_name" {
  type = string
}

variable "revision_mode" {
  type = string
  default = "Single"
}

variable "solution_name" {
  type = string
}
