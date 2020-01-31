# App Service (Public Certificate) ARM Template

Basic ARM templates that will help to enforce compliance with the programme
governance for public certificates used with app services. Should be a
template available for each valid intermediate certificate in use.

## Parameters

The following sections detail the ARM template parameters and how they should
be used when executing the template.

### siteName

| Name                     | Required | Type    | AVs |
| ------------------------ |:--------:| ------- |:---:|
| afName                   | yes      | string  | no  |

The name of the app service site that we are associating the certificate to.

## Usage

Using the development intermediate certificate.

```powershell
Set-AzContext -SubscriptionId SUBSCRIPTION_UUID
New-AzResourceGroupDeployment `
  -Name example-deployment `
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/templates/v1/app-service/pki/development/template.json `
  -siteName "app-service-site-name" `
  -ResourceGroupName "example-resource-group-rg"
```

Using the production intermediate certificate.

```powershell
Set-AzContext -SubscriptionId SUBSCRIPTION_UUID
New-AzResourceGroupDeployment `
  -Name example-deployment `
  -TemplateUri https://raw.githubusercontent.com/hmcts/ops-arm-templates/master/templates/v1/app-service/pki/production/template.json `
  -siteName "app-service-site-name" `
  -ResourceGroupName "example-resource-group-rg"
```
