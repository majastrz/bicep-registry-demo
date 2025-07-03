param updateTag string = utcNow()

resource msi 'Microsoft.ManagedIdentity/userAssignedIdentities@2024-11-30' existing = {
  scope: resourceGroup('majastrz-script-msi')
  name: 'majastrz-script-reader'
}

resource script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'cli-msi'
  location: resourceGroup().location
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${msi.id}': {}
    }
  }
  kind: 'AzureCLI'
  properties: {
    forceUpdateTag: updateTag
    azCliVersion: '2.74.0'
    retentionInterval: 'PT1H'
    scriptContent: loadTextContent('script.sh')
    cleanupPreference: 'OnSuccess'
  }
}

output result object = script.properties.outputs
