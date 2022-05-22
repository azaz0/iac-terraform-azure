#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app_function

resource "azurerm_resource_group" "student_75941_resource" {
  name     = var.student_75941_resource_group_name
  location = var.student_75941_resource_group_location
  id       = var.student_75941_resource_group_id
}

resource "azurerm_storage_account" "student_75941_resource" {
  name                     = var.student_75941_storage_account.name
  resource_group_name      = var.student_75941_resource_group_name
  location                 = var.student_75941_resource_group_location
  account_tier             = var.student_75941_storage_account.account_tier
  account_replication_type = var.student_75941_storage_account.replication_type
  access_key               = var.student_75941_storage_account.access_key
}

resource "azurerm_service_plan" "student_75941_resource" {
  name                = var.student_75941_storage_service_plan.name
  resource_group_name = var.student_75941_resource_group_name
  location            = var.student_75941_resource_group_location
  os_type             = var.student_75941_storage_service_plan.os_type
  sku_name            = var.student_75941_storage_service_plan.sku_name
}

resource "azurerm_linux_function_app" "student_75941_resource" {
  name                = var.student_75941_linux_function_app.name
  resource_group_name = var.student_75941_resource_group_name
  location            = var.student_75941_resource_group_location
  service_plan_id     = var.student_75941_resource_group_id

  storage_account_name       = var.student_75941_storage_account.name
  storage_account_access_key = var.student_75941_storage_account.access_key

/*  site_config {
    application_stack {
      python_version = "3.10"
    }
  }*/
}

resource "azurerm_function_app_function" "student_75941_resource" {
  name            = var.student_75941_function_app_function.name
  function_app_id = var.student_75941_resource_group_id
  language        = var.student_75941_function_app_function.language
  /*test_data       = var.student_75941_function_app_function.test_data
    config_json = jsonencode({
      "bindings" = [
        {
          "authLevel" = "function"
          "direction" = "in"
          "methods" = [
            "get",
            "post",
          ]
          "name" = "req"
          "type" = "httpTrigger"
        },
        {
          "direction" = "out"
          "name"      = "$return"
          "type"      = "http"
        },
      ]
    })*/
}