# Web Test to monitor page status. 
[![Deploy to Azure](https://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fgithub.com%2Fhmcts%2Frdo-arm-templates%2Fblob%2Fmaster%2Fwebtestalert%2Fapp_ins_alerts.json)

Ping test to monitor url availability. 

Requirements for the test to pass are: 
* monitored page has to return 200 OK! (default setting)
* monitored page body has to return custom query, ie. "All Systems Operational"

The test will fail and trigger an alert if either of these conditions is not met. 

## Required input: 

```json
"app_ins_name": {
    "value": "mywebpage-ai"
    }
```
`app_ins_name`  :   name for your Application Insights


```json
"health_page": {
    "value": [
        {
        "name": "mywebpagetest",
        "url": "https://mywebpage.com/api/latest/status.json",
        "findText": "All Systems Operational"
        }
    ]
}
```
`name`          :      name for your Availability Test

`url`           :      URL for the page you want to monitor

`findText`      :      search phrase that must appear in the page for the webtest to pass


```json
"queryRule":{
    "value": [
        {
        "actionGroup": "/subscriptions/MySubscriptionGUID/resourceGroups/MyLogAlertsSpace/providers/microsoft.insights/actionGroups/MyActionGroup"
        }
    ]
}
```

`actionGroup`   : 	https://docs.microsoft.com/en-us/azure/azure-monitor/platform/action-groups

## Default settings
Ping test locations     : UK South, UK West

Page Http Status Code   : 200 OK

Log Analytics Query     : `availabilityResults\n| where message contains \"Validation Rule Error\"\n`

Severity                : 0 (Highest)

