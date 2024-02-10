
resource script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'myScript'
  location: 'spaincentral'
  kind: 'AzurePowerShell'
  properties: {
    azPowerShellVersion: '9.7'
    retentionInterval: 'PT1H'
    scriptContent: loadTextContent('script.ps1')
  }
}
