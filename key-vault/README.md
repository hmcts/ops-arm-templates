# Key Vault ARM Template

Basic ARM template that will help to enforce compliance with the programme
governance for Key Vault components.

## Parameters

The following sections detail the ARM template parameters and how they should
be used when executing the template.

### kvName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvName                   | yes      | string  | no  |

The name of the Key Vaultp when it is created.

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

### kvTag_ManagedBy

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvTag_ManagedBy          | yes      | string  | yes |

The `managedBy` tag value. Has allowed values of `DevOps`.

### kvTag_SolutionOwner

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvTag_SolutionOwner      | yes      | string  | yes |

The `solutionOwner` tag value. Has allowed values of `DTS`.

### kvTag_ActivityName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvTag_ActivityName       | yes      | string  | yes |

The `activityName` tag value. Has allowed values of `Cloud Management`.

### kvTag_DataClassification

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvTag_DataClassification | yes      | string  | yes |

The `dataClassification` tag value. Has allowed values of `internal`, `secret`
and `public`.

### kvTag_Automation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvTag_Automation         | no       | string  | no  |

The `automation` tag value. Has default value of `{}`.

### kvTag_CostCentre

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvTag_CostCentre         | yes      | string  | yes |

The `costCentre` tag value. Has allowed values of `10245117`.

### kvTag_Environment

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvTag_Environment        | yes      | string  | yes |

The `environment` tag value. Has allowed values of `sandbox`, `development`,
`testing`, `ithc`, `production`, `staging`, `demo`, `production` and
`management`.

### kvTag_Criticality

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| kvTag_Criticality        | yes      | string  | yes |

The `criticality` tag value. Has allowed values of `high`, `medium` and `low`.

---

## Usage

```powershell
Set-AzContext -SubscriptionId SUBSCRIPTION_UUID
New-AzDeployment `
  -Name example-deployment `
  -Location uksouth `
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/key-vault/template.json `
  -kvName unique-key-vault-name-here `
  -kvLocation uksouth `
  -kvTenant xxx `
  -kvTag_ManagedBy DevOps `
  -kvTag_SolutionOwner DTS `
  -kvTag_ActivityName "Cloud Management" `
  -kvTag_DataClassification internal `
  -kvTag_CostCentre 10245117 `
  -kvTag_Environment sandbox `
  -kvTag_Criticality low
```
