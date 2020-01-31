# Landing zone Network ARM Template

Landing zone Network ARM template that will help to enforce compliance with the programme
governance for both locations in uksouth and ukwest.

## Parameters

The following sections detail the ARM template parameters and how they should
be used when executing the template.

### lzrtName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| lzrtName                 | yes      | string  | no  |

The name of the Route Table when it is created. Each route table will be deployed in uksouth and ukwest.

### lzvnName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| lzvnName                 | yes      | string  | no  |

The name of the Virtual Network when it is created. Each route table will be deployed in uksouth and ukwest.

### lznsgName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| lznsgName                | yes      | string  | yes |

The name of the Network Security Group when it is created. Each route table will be deployed in uksouth and ukwest.

### lzLocation

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| lzLocation               | yes      | string  | no  |

The location for the Landing Zone components. Has allowed values of
`uksouth` and `ukwest`.

### lzrtIP

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| lzrtIP                   | yes      | string  | no  |

The IP address of the Route Table.

### lzrtHopIP

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| lzrtHopIP                | yes      | string  | no  |

The hop IP address of the route table.

### lzvnIP

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| lzvnIP                   | yes      | string  | no  |

The IP address of the Virtual Network.

### lzvnmgmtsubnetIP

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| lzvnmgmtsubnetIP         | yes      | string  | no  |

The IP address of the Virtual Network management subnet.

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
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/templates/v1/landing-zone/template-etwork.json `
  -TemplateParameterFile $tempParamFile.FullName `
  -ResourceGroupName `
  -lzrtName `
  -lzvnName `
  -lznsgName `
  -lzrtIP `
  -lzrtHopIp `
  -lzvnIp `
  -lzvnmgmtsubnetIp `
  -cTag_ActivityName `
  -cTag_Environment `
  -cTag_Criticality `
  -cTag_CostCentre `
  -cTag_ManagedBy `
  -cTag_SolutionOwner `
  -cTag_DataClassification `
Remove-Item $tempParamFile.FullName -Force
```
