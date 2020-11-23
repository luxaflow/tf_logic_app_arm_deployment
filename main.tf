resource "azurerm_template_deployment" "logic_app_deployment" {
  name                = var.name
  resource_group_name = var.resource_group
  deployment_mode     = "Incremental"
  template_body       = file(var.template_path)
  parameters_body     = file(var.parameters_template_path)
}

data "azurerm_logic_app_workflow" "logic_app" {
  name                = var.name
  resource_group_name = var.resource_group

  depends_on =[
    azurerm_template_deployment.logic_app_deployment
  ]
}

data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  count               = var.enable_diagnostic_setting ? 1 : 0
  name                = var.log_analytics_workspace
  resource_group_name = var.log_analytics_resource_group
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  count = var.enable_diagnostic_setting ? 1 : 0

  name                        = var.diagnostic_setting
  target_resource_id          = data.azurerm_logic_app_workflow.logic_app.id
  log_analytics_workspace_id  = data.azurerm_log_analytics_workspace.log_analytics_workspace[0].id

  log {
    category = "WorkflowRuntime"
    enabled = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled = false

    retention_policy {
      enabled = false
    }
  }

  depends_on = [ azurerm_monitor_diagnostic_setting.diagnostic_setting ]
}