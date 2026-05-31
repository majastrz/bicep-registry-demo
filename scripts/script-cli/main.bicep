param updateTag string = utcNow()

resource script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'majastrz-script'
  location: resourceGroup().location
  kind: 'AzureCLI'
  properties: {
    forceUpdateTag: updateTag
    azCliVersion: '2.38.0'
    retentionInterval: 'PT1H'
    scriptContent: loadTextContent('script.sh')
  }
}
