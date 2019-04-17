# webtestalert
[![Deploy to Azure](https://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fgithub.com%2Fhmcts%2Frdo-arm-templates%2Fblob%2Fmaster%2Fwebtestalert%2Fapp_ins_alerts.json)

Required input: 

```json
"app_ins_name": {
    "value": "rdo-temp-statuspage-ai"
    }
```
app_ins_name: 	name for your application insights

```json
"health_page": {
    "value": [
        {
        "name": "MyWebPage",
        "url": "https://mywebpage.com/api/latest/status.json",
        "findText": "All Systems Operational"
        }
    ]
}
```
name: 		name for your Availability Test 
url: 		URL for the page you want to monitor
findText: 	search phrase that must appear in the page for the webtest to pass

```json
"queryRule":{
    "value": [
        {
        "actionGroup": "/subscriptions/MySubscriptionGUID/resourceGroups/MyLogAlertsSpace/providers/microsoft.insights/actionGroups/MyActionGroup"
        }
    ]
}
```
actionGroup: 	https://docs.microsoft.com/en-us/azure/azure-monitor/platform/action-groups

