variable "name" {
  type        = string
  description = "Should be name of the Logic App as used in the ARM template"
}

variable "resource_group" {
  type        = string
  description = "name of the resource group the Logic App is deployed in"
}

variable "template_path" {
  type        = string
  description = "path to Logic App ARM template"
}

variable "parameters_template_path" {
  type        = string
  description = "path to Logic App Parameter template"
}

variable "enable_diagnostic_setting" {
  type        = bool
  default     = false
  description = "should be true if diagnostic setting should be created"
}

variable "diagnostic_setting" {
  type        = string
  default     = null 
  description = "name of the diagnostic setting entry in the Logic App"
}

variable "log_analytics_workspace" {
  type        = string
  default     = null
  description = "name of Log Analytics Workspace for the diagnostic setting"
}

variable "log_analytics_resource_group" {
  type        = string
  default     = null
  description = "name of the resource group that contains the Log Analytics Workspace"
}