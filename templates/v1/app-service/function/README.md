# App Service (Function) ARM Template

Basic ARM template that will help to enforce compliance with the programme
governance for application service function components.

## Parameters

The following sections detail the ARM template parameters and how they should
be used when executing the template.

### afName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afName                   | yes      | string  | no  |

The name of the Application Service Plan when it is created.

### afLocation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afLocation               | no       | string  | yes |

The location for the Application Service Function component. Has allowed values
of `uksouth` and `ukwest`. Defaults to `uksouth`.

### afKind

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afKind                   | yes      | string  | yes |

The environment kind for the App Service Plan. Has allowed values of
`functionapp`.

### afSubscriptionId

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afSubscriptionId         | yes      | string  | no  |

The subscription ID for the component to be installed.

### afResourceGroup

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afResourceGroup          | yes      | string  | no  |

The resource group name for the component to be installed.

### afAiName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afAiName                 | yes      | string  | no  |

The Application Insights name to be connect to this app service function.

### afAspName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afAspName                | yes      | string  | no  |

The App Service Plan name for the hosting of this app service function.

### afAspResourceGroup

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afAspResourceGroup       | no       | string  | no  |

The resource group name that contains the App Service Plan component to host
this app service function. If empty then defaults to the same resource group as
the App Service Function.

### afStorageAccountName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afStorageAccountName     | yes      | string  | no  |

The App Service Plan name for the hosting of this app service function.

### afStorageAccountResourceGroup

| Name                          | Required | Type    | AVs |
| ----------------------------- |:--------:| ------- |:---:|
| afStorageAccountResourceGroup | no       | string  | no  |

The resource group name that contains the Storage Account component to host
this app service function content. If empty then defaults to the same resource
group as the App Service Function.

### afRuntime

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afRuntime                | yes      | string  | yes |

The function runtime execution engine. Has allowed values of `powershell`.

### afHostingEnvironment

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afHostingEnvironment     | no       | string  | yes |

The Hosting Environment for the App Service Function. Has allowed values of
`""`. Has a default value of `""`.

### afAssignedIdentity

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afAssignedIdentity       | no       | string  | yes |

The Managed Identity assignment for the App Service Function. How allowed values
of `None` and `SystemAssigned`. Defaults to `None`.

### afClientCertEnabled

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afClientCertEnabled      | no       | bool    | na  |

Should client certificates be required for this app service function to
accept inbound connections. Has a default value of `false`.

### cTag_ManagedBy

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| cTag_ManagedBy          | yes      | string  | yes |

The `managedBy` tag value. Has allowed values of `DevOps`.

### cTag_SolutionOwner

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| cTag_SolutionOwner      | yes      | string  | yes |

The `solutionOwner` tag value. Has allowed values of `DTS`.

### cTag_ActivityName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| cTag_ActivityName       | yes      | string  | yes |

The `activityName` tag value. Has allowed values of `Cloud Management`.

### cTag_DataClassification

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| cTag_DataClassification | yes      | string  | yes |

The `dataClassification` tag value. Has allowed values of `internal`, `secret`
and `public`.

### cTag_Automation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| cTag_Automation         | no       | string  | no  |

The `automation` tag value. Has default value of `{}`.

### cTag_CostCentre

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| cTag_CostCentre         | yes      | string  | yes |

The `costCentre` tag value. Has allowed values of `10245117`.

### cTag_Environment

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| cTag_Environment        | yes      | string  | yes |

The `environment` tag value. Has allowed values of `sandbox`, `development`,
`testing`, `ithc`, `production`, `staging`, `demo`, `production` and
`management`.

### cTag_Criticality

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| cTag_Criticality        | yes      | string  | yes |

The `criticality` tag value. Has allowed values of `high`, `medium` and `low`.

---

## Usage

Basic usage (assuming everything is for the destination RG):

```powershell
Set-AzContext -SubscriptionId SUBSCRIPTION_UUID
New-AzResourceGroupDeployment `
  -Name example-deployment `
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/templates/v1/app-service/function/template.json `
  -TemplateParameterUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/parameters/common/tags/devops.json `
  -ResourceGroupName "example-resource-group-rg" `
  -afSubscriptionId "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" `
  -afName example-app-function `
  -afLocation uksouth `
  -afKind "functionapp" `
  -afRuntime powershell `
  -afResourceGroup "example-resource-group-rg" `
  -afStorageAccountName "example-storage-account-sa" `
  -afAspName "example-app-storage-plan-asp" `
  -afAiName "example-application-insights-ai" `
  -cTag_ActivityName "Cloud Management" `
  -cTag_Environment sandbox `
  -cTag_Criticality low
```

Usage if we are using alternative resource groups for the storage account and

```powershell
Set-AzContext -SubscriptionId SUBSCRIPTION_UUID
Invoke-WebRequest `
    -OutFile ($tempParamFile = New-TemporaryFile).FullName `
    -Uri "https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/parameters/v1/common/tags/devops.json" `
    -ErrorAction Stop
New-AzResourceGroupDeployment `
  -Name example-deployment `
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/templates/v1/app-service/function/template.json `
  -TemplateParameterFile $tempParamFile.FullName `
  -ResourceGroupName "example-resource-group-rg" `
  -afSubscriptionId "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" `
  -afName example-app-function `
  -afLocation uksouth `
  -afKind "functionapp" `
  -afRuntime powershell `
  -afResourceGroup "example-resource-group-rg" `
  -afStorageAccountName "example-storage-account-sa" `
  -afStorageAccountResourceGroup "example-storage-account-rg" `
  -afAspName "example-app-storage-plan-asp" `
  -afAspResourceGroup "example-app-service-plan-rg" `
  -afAiName "example-application-insights-ai" `
  -cTag_ActivityName "Cloud Management" `
  -cTag_Environment sandbox `
  -cTag_Criticality low
Remove-Item $tempParamFile.FullName -Force
```
