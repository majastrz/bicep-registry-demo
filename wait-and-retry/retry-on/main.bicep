param updateTag string = utcNow()

resource script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'flakyScript'
  location: resourceGroup().location
  kind: 'AzurePowerShell'
  properties: {
    forceUpdateTag: updateTag
    azPowerShellVersion: '14.0'
    retentionInterval: 'PT1H'
    scriptContent: loadTextContent('./flakyScript.ps1')
  }
}
