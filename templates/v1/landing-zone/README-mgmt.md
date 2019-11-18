# Landing zone Management ARM Template

Landing zone management ARM template that will help to enforce compliance with the programme
governance.

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

### kvName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvName                   | yes      | string  | no  |

The name of the Key Vault when it is created.

### kvLocation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvLocation               | no       | string  | yes |

The location for the Resource Group. Has allowed values of `uksouth` and
`ukwest`. Defaults to `uksouth`.

### kvTenant

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvTenant                 | yes      | string  | no  |

The tenant to be associated with the Key Vault for Azure AD.

### kvEnabledForDeployment

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvEnabledForDeployment   | no       | bool    | no  |

Is the Key Vault enabled for deployment. Defaults to `false`.

### kvEnabledForDiskEncryption

| Name                       | Required | Type    | AVs |
| -------------------------- |:--------:| ------- |:---:|
| kvEnabledForDiskEncryption | no       | bool    | no  |

Is the Key Vault enabled for disk encryption. Defaults to `false`.

### kvEnabledForTemplateDeployment

| Name                           | Required | Type    | AVs |
| ------------------------------ |:--------:| ------- |:---:|
| kvEnabledForTemplateDeployment | no       | bool    | no  |

Is the Key Vault enabled for template deployment. Defaults to `false`.
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

### rsvName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| rsvName                  | yes      | string  | no |

The name of the recovery services vault when it is created.

### wsName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| wsName                   | yes      | string  | no |

The name of the workspace when it is created.

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
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/templates/v1/landing-zone/template-mgmt.json `
  -TemplateParameterFile $tempParamFile.FullName `
  -ResourceGroupName `
  -aiName `
  -aiLocation `
  -aiAppName dts-sandbox `
  -kvName dts-sandbox-kv `
  -kvLocation uksouth `
  -kvTenant `
  -saName `
  -saLocation `
  -saAccountType `
  -saKind `
  -saAccessTier `
  -saSoftDeleteRetention `
  -rsvName `
  -wsName `
  -cTag_ActivityName `
  -cTag_Environment `
  -cTag_Criticality low `
  -cTag_CostCentre 10245117 `
  -cTag_ManagedBy DevOps `
  -cTag_SolutionOwner DTS `
  -cTag_DataClassification internal `
Remove-Item $tempParamFile.FullName -Force
```
