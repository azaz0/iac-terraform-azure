variable "student_75941_resource_group_name" {
  type    = string
  default = "test-resources"
}

variable "student_75941_resource_group_location" {
  type    = string
  default = "eastus"
}

variable "student_75941_resource_group_id" {
  type    = number
  default = 1234
}

variable "student_75941_storage_account" {
  type = list(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    access_key = string
  }))
  default = [
    {
      name                     = "student_75941_resource"
      resource_group_name      = var.student_75941_resource_group_name
      location                 = var.student_75941_resource_group_location
      account_tier             = "Standard"
      account_replication_type = "LRS"
      access_key = "4321"
    }
  ]
}

variable "student_75941_storage_service_plan" {
  type = list(object({
    name                = string
    location            = string
    resource_group_name = string
    os_type             = string
    sku_name            = string
  }))
  default = [
    {
      name                = "student_75941_resource-service-plan"
      resource_group_name = var.student_75941_resource_group_name
      location            = var.student_75941_resource_group_location
      os_type             = "Linux"
      sku_name            = "free"
    }
  ]
}

variable "student_75941_linux_function_app" {
  type = list(object({
    name                = string
    location            = string
    resource_group_name = string
    service_plan_id     = string

    storage_account_name = string
    /*    storage_account_access_key = azurerm_storage_account.student_75941_resource.primary_access_key*/
  }))
  default = [
    {
      name                 = "student_75941_resource-function-app"
      resource_group_name  = var.student_75941_resource_group_name
      location             = var.student_75941_resource_group_location
      service_plan_id      = var.student_75941_resource_group_id
      storage_account_name = var.student_75941_resource_group_name
      /*      storage_account_access_key = azurerm_storage_account.student_75941_resource.primary_access_key*/
    }
  ]
}

variable "python-version" {
  type    = string
  default = "3.8"
}

variable "student_75941_function_app_function" {
  type = list(object({
    name            = string
    function_app_id = number
    language        = string
   /* test_data       = object({ name = string })*/
  }))
  default = [
    {
      name            = "student_75941_resource-function-app-function"
      function_app_id = var.student_75941_resource_group_id
      language        = "Python"
      test_data       = jsonencode({
        "name" = "Azure"
      })
    }
  ]
}