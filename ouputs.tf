output "logic_app_id" {
  value = data.azurerm_logic_app_workflow.logic_app.id
  description = "Id of the Logic App"
}