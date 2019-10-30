# Resource Group ARM Template

Basic ARM template that will help to enforce compliance with the programme
governance.

## Parameters

The following sections detail the ARM template parameters and how they should
be used when executing the template.

### rgName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| rgName                   | yes      | string  | no  |

The name of the Resource Group when it is created. It has limited logic flow
in the template so that if the RG is not appended `-rg` this will automatically
be performed.

### rgLocation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| rgLocation               | no       | string  | yes |

The location for the Resource Group. Has allowed values of `uksouth` and
`ukwest`. Defaults to `uksouth`.

### rgTag_ManagedBy

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| rgTag_ManagedBy          | yes      | string  | yes |

The `managedBy` tag value. Has allowed values of `DevOps`.

### rgTag_SolutionOwner

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| rgTag_SolutionOwner      | yes      | string  | yes |

The `solutionOwner` tag value. Has allowed values of `DTS`.

### rgTag_ActivityName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| rgTag_ActivityName       | yes      | string  | yes |

The `activityName` tag value. Has allowed values of `Cloud Management`.

### rgTag_DataClassification

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| rgTag_DataClassification | yes      | string  | yes |

The `dataClassification` tag value. Has allowed values of `internal`, `secret`
and `public`.

### rgTag_Automation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| rgTag_Automation         | no       | string  | no  |

The `automation` tag value. Has default value of `{}`.

### rgTag_CostCentre

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| rgTag_CostCentre         | yes      | string  | yes |

The `costCentre` tag value. Has allowed values of `10245117`.

### rgTag_Environment

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| rgTag_Environment        | yes      | string  | yes |

The `environment` tag value. Has allowed values of `sandbox`, `development`,
`testing`, `ithc`, `production`, `staging`, `demo`, `production` and
`management`.

### rgTag_Criticality

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| rgTag_Criticality        | yes      | string  | yes |

The `criticality` tag value. Has allowed values of `high`, `medium` and `low`.

---

## Usage

```powershell
Set-AzContext -SubscriptionId SUBSCRIPTION_UUID
New-AzDeployment `
  -Name example-deployment `
  -Location uksouth `
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/resource-group/template.json `
  -rgName example-resource-group `
  -rgLocation uksouth `
  -rgTag_ManagedBy DevOps `
  -rgTag_SolutionOwner DTS `
  -rgTag_ActivityName "Cloud Management" `
  -rgTag_DataClassification internal `
  -rgTag_CostCentre 10245117 `
  -rgTag_Environment sandbox `
  -rgTag_Criticality low
```
