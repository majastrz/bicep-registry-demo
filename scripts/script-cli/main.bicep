param updateTag string = utcNow()

resource script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'myScript4'
  location: 'bleufrancesouth'
  kind: 'AzureCLI'
  properties: {
    forceUpdateTag: updateTag
    azCliVersion: '2.9.1'
    retentionInterval: 'PT1H'
    scriptContent: loadTextContent('script.sh')
  }
}
