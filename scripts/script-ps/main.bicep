param updateTag string = utcNow()

resource script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'myScript2'
  location: resourceGroup().location
  kind: 'AzurePowerShell'
  properties: {
    forceUpdateTag: updateTag
    azPowerShellVersion: '14.0'
    retentionInterval: 'PT1H'
    scriptContent: loadTextContent('script.ps1')
  }
}
