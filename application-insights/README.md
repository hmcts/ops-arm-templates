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

### aiTag_ManagedBy

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aiTag_ManagedBy          | yes      | string  | yes |

The `managedBy` tag value. Has allowed values of `DevOps`.

### aiTag_SolutionOwner

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aiTag_SolutionOwner      | yes      | string  | yes |

The `solutionOwner` tag value. Has allowed values of `DTS`.

### aiTag_ActivityName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aiTag_ActivityName       | yes      | string  | yes |

The `activityName` tag value. Has allowed values of `Cloud Management`.

### aiTag_DataClassification

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aiTag_DataClassification | yes      | string  | yes |

The `dataClassification` tag value. Has allowed values of `internal`, `secret`
and `public`.

### aiTag_Automation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aiTag_Automation         | no       | string  | no  |

The `automation` tag value. Has default value of `{}`.

### aiTag_CostCentre

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aiTag_CostCentre         | yes      | string  | yes |

The `costCentre` tag value. Has allowed values of `10245117`.

### aiTag_Environment

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aiTag_Environment        | yes      | string  | yes |

The `environment` tag value. Has allowed values of `sandbox`, `development`,
`testing`, `ithc`, `production`, `staging`, `demo`, `production` and
`management`.

### aiTag_Criticality

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aiTag_Criticality        | yes      | string  | yes |

The `criticality` tag value. Has allowed values of `high`, `medium` and `low`.

---

## Usage

```powershell
Set-AzContext -SubscriptionId SUBSCRIPTION_UUID
New-AzResourceGroupDeployment `
  -Name example-deployment `
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/application-insights/template.json `
  -ResourceGroupName "example-resource-group-rg" `
  -aiName example-application-insight `
  -aiLocation uksouth `
  -aiTag_ManagedBy DevOps `
  -aiTag_SolutionOwner DTS `
  -aiTag_ActivityName "Cloud Management" `
  -aiTag_DataClassification internal `
  -aiTag_CostCentre 10245117 `
  -aiTag_Environment sandbox `
  -aiTag_Criticality low
```
