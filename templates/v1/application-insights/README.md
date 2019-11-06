# Application Insights ARM Template

Basic ARM template that will help to enforce compliance with the programme
governance for application insight components.

## Parameters

The following sections detail the ARM template parameters and how they should
be used when executing the template.

### aiName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aiName                   | yes      | string  | no  |

The name of the Application Insight when it is created. It has limited logic
flow in the template so that if the AI is not appended `-ai` this will
automatically be performed.

### aiLocation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aiLocation               | no       | string  | yes |

The location for the Application Insights component. Has allowed values of
`uksouth` and `ukwest`. Defaults to `uksouth`.

### aiAppName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aiAppName                | no       | string  | no  |

The application name for the Application Insights component. Defaults to a
blank string `""`.

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

```powershell
Set-AzContext -SubscriptionId SUBSCRIPTION_UUID
Invoke-WebRequest `
    -OutFile ($tempParamFile = New-TemporaryFile).FullName `
    -Uri "https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/parameters/v1/common/tags/devops.json" `
    -ErrorAction Stop
New-AzResourceGroupDeployment `
  -Name example-deployment `
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/templates/v1/application-insights/template.json `
  -TemplateParameterFile $tempParamFile.FullName `
  -ResourceGroupName "example-resource-group-rg" `
  -aiName example-application-insight `
  -aiLocation uksouth `
  -cTag_ActivityName "Cloud Management" `
  -cTag_Environment sandbox `
  -cTag_Criticality low
Remove-Item $tempParamFile.FullName -Force
```
