# App Service (Plan) ARM Template

Basic ARM template that will help to enforce compliance with the programme
governance for application service plan components.

## Parameters

The following sections detail the ARM template parameters and how they should
be used when executing the template.

### aspName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspName                   | yes      | string  | no  |

The name of the Application Service Plan when it is created. It has limited
logic flow in the template so that if the ASP is not appended `-asp` this will
automatically be performed.

### aspLocation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspLocation               | no       | string  | yes |

The location for the Application Service Plan component. Has allowed values of
`uksouth` and `ukwest`. Defaults to `uksouth`.

### aspKind

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspKind                  | no       | string  | yes |

The environment kind for the App Service Plan. Has allowed values of `""`. Has
a default value of `""`.

### aspWorkerSize

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspWorkerSize            | no       | string  | yes |

The size of the workers for the App Service Plan. Has allowed values of `0`. Has
a default value of `0`.

### aspWorkerSizeId

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspWorkerSizeId          | no       | string  | yes |

The size ID of the workers for the App Service Plan. Has allowed values of `0`.
Has a default value of `0`.

### aspNumberOfWorkers

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspNumberOfWorkers       | no       | string  | yes |

The number of workers for the App Service Plan. Has allowed values of `1` and
`2`. Has a default value of `1`.

### aspHostingEnvironment

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspHostingEnvironment    | no       | string  | yes |

The Hosting Environment for the App Service Plan. Has allowed values of `""`.
Has a default value of `""`.

### aspSku

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspSku                   | no       | string  | yes |

The SKU for the App Service Plan. Has allowed values of `Dynamic`. Has a
default value of `Dynamic`.

### aspSkuCode

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspSkuCode               | no       | string  | yes |

The SKU Code for the App Service Plan. Has allowed values of `Y1`. Has a
default value of `Y1`.

### aspTag_ManagedBy

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspTag_ManagedBy          | yes      | string  | yes |

The `managedBy` tag value. Has allowed values of `DevOps`.

### aspTag_SolutionOwner

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspTag_SolutionOwner      | yes      | string  | yes |

The `solutionOwner` tag value. Has allowed values of `DTS`.

### aspTag_ActivityName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspTag_ActivityName       | yes      | string  | yes |

The `activityName` tag value. Has allowed values of `Cloud Management`.

### aspTag_DataClassification

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspTag_DataClassification | yes      | string  | yes |

The `dataClassification` tag value. Has allowed values of `internal`, `secret`
and `public`.

### aspTag_Automation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspTag_Automation         | no       | string  | no  |

The `automation` tag value. Has default value of `{}`.

### aspTag_CostCentre

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspTag_CostCentre         | yes      | string  | yes |

The `costCentre` tag value. Has allowed values of `10245117`.

### aspTag_Environment

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspTag_Environment        | yes      | string  | yes |

The `environment` tag value. Has allowed values of `sandbox`, `development`,
`testing`, `ithc`, `production`, `staging`, `demo`, `production` and
`management`.

### aspTag_Criticality

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| aspTag_Criticality        | yes      | string  | yes |

The `criticality` tag value. Has allowed values of `high`, `medium` and `low`.

---

## Usage

```powershell
Set-AzContext -SubscriptionId SUBSCRIPTION_UUID
New-AzResourceGroupDeployment `
  -Name example-deployment `
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/app-service/plan/template.json `
  -ResourceGroupName "example-resource-group-rg" `
  -aspName example-app-service-plan `
  -aspLocation uksouth `
  -aspTag_ManagedBy DevOps `
  -aspTag_SolutionOwner DTS `
  -aspTag_ActivityName "Cloud Management" `
  -aspTag_DataClassification internal `
  -aspTag_CostCentre 10245117 `
  -aspTag_Environment sandbox `
  -aspTag_Criticality low
```
