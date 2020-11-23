# Terraform module for Azure Logic Apps
Module will deploy Azure Logic App from ARM Templates

## Module input variables
---
- `name` - name of the Logic App as used in the ARM template
- `resource_group` - name of the resource group the Logic App is deployed in
- `template_path` - path to Logic App ARM template
- `parameters_template_path` - path to Logic App Parameter template
- `enable_diagnostic_setting` - should be true if diagnostic setting should be created
- `diagnostic_setting` - name of the diagnostic setting entry in the Logic App
- `log_analytics_workspace` - name of Log Analytics Workspace for the diagnostic setting
- `log_analytics_resource_group` - name of the resource group that contains the Log Analytics Workspace

## Notes
---
- Only WorkflowRuntime logs are enabled in the diagnostic settings
- Parameter should be added without schema and not in parameter object.

Parameters Template example
```json
{
  "parameter1": {
    "value": "my-value1"
  },
  "parameter2": {
    "value": "my-value2"
  },
  ...
}
```

## Usage
---
Logic App only
```hcl
module "logic_app" {
  source = "github.com/luxaflow/tf_logic_app_template_deployment"

  name                      = "my-logicapp"
  resource_group_name       = "my-resourcegroup"
  template_path             = "./my-logicapp/LogicApp.json"
  parameters_template_path  = "./my-logicapp/LogicApp.parameter.json"
}
```

Logic App with diagnostic setting
```hcl
module "logic_app" {
  source = "github.com/luxaflow/tf_logic_app_template_deployment"

  name                          = "my-logicapp"
  resource_group_name           = "my-resourcegroup"
  template_path                 = "./my-logicapp/LogicApp.json"
  parameters_template_path      = "./my-logicapp/LogicApp.parameter.json"

  diagnostic_setting            = "my-diagnosticsetting"
  log_analytics_workspace       = "my-loganalytics-workspace"
  log_analytics_resource_group  = "my-loganalytics-resourcegroup"
}
```

## Outputs
---
- `logic_app_id` - id of the Logic App


## Author
Created by [Lucas Wolfe](https://www.github.com/luxaflow)

## License
Apache 2 Licensed. See LICENSE for full details.