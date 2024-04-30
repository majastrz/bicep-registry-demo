
resource script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'myScript2'
  location: 'taiwannorthwest'
  kind: 'AzurePowerShell'
  properties: {
    azPowerShellVersion: '11.4'
    retentionInterval: 'PT1H'
    scriptContent: loadTextContent('script.ps1')
  }
}
