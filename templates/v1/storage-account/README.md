# Storage Account ARM Template

Basic ARM template that will help to enforce compliance with the programme
governance for storage account components.

## Parameters

The following sections detail the ARM template parameters and how they should
be used when executing the template.

### saName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| saName                   | yes      | string  | no  |

The name of the Storage Account when it is created.

### saLocation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| saLocation               | no       | string  | yes |

The location for the Application Insights component. Has allowed values of
`uksouth` and `ukwest`. Defaults to `uksouth`.

### saKind

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| saKind                   | no       | string  | yes |

The storage account kind to be created. Has allowed values of `StorageV2`.
Defaults to `StorageV2`.

### saAccountType

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| saAccountType            | no       | string  | yes |

The storage account type to be created. Has allowed values of `Standard_LRS`,
`Standard_ZRS`, `Standard_GRS` and `Standard_RAGRS`. Defaults to `Standard_ZRS`.

### saAccessTier

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| saAccountType            | no       | string  | yes |

The storage account access tier to be created. Has allowed values of `Hot` and
`Cool`. Defaults to `Cool`.

## saSoftDelete

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| saAccountType            | no       | boolean | na  |

If soft delete should be enabled on the BLOB storage elements. Defaults to
`True`.

## saSoftDeleteRetention

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| saSoftDeleteRetention    | no       | int     | no  |

How many days retention for the soft delete protection. Defaults to `7`.

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
New-AzResourceGroupDeployment `
  -Name example-deployment `
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/templates/v1/storage-account/template.json `
  -TemplateParameterUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/parameters/common/tags/devops.json `
  -ResourceGroupName "example-resource-group-rg" `
  -saName random-string-here `
  -saLocation uksouth `
  -cTag_ActivityName "Cloud Management" `
  -cTag_Environment sandbox `
  -cTag_Criticality low
```
