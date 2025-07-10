param updateTag string = utcNow()

param locationOverride string?

resource script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'myScript2'
  location: locationOverride ?? resourceGroup().location
  kind: 'AzurePowerShell'
  properties: {
    forceUpdateTag: updateTag
    azPowerShellVersion: '14.0'
    retentionInterval: 'PT1H'
    scriptContent: loadTextContent('script.ps1')
  }
}
